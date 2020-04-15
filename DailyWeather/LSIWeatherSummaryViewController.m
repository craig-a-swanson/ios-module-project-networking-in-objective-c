//
//  LSIWeatherSummaryViewController.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LSIWeatherSummaryViewController.h"
#import "LSIWeatherIcons.h"
#import "LSICardinalDirection.h"
#import "LSIFileHelper.h"
#import "LSILog.h"
#import "LSIErrors.h"
#import "LSICurrentWeather.h"
#import "LSIWeatherForcast.h"
#import "LSICurrentWeatherChildViewController.h"
#import "LSIHourlyChildViewController.h"
#import "LSIDailyWeatherTableViewCell.h"
#import "WeatherFetcher.h"
#import "LSIDailyForcast.h"
#import "LSIHourlyForcast.h"

@interface LSIWeatherSummaryViewController () {
    BOOL _requestedLocation;
}

// MARK: - Properties
@property CLLocationManager *locationManager;
@property CLLocation *location;
@property (nonatomic) CLPlacemark *placemark;
@property (nonatomic) LSICurrentWeather *currentForecast;
@property (nonatomic) LSIHourlyForcast *hourlyForecast;
@property (nonatomic) LSIDailyForcast *dailyForecast;
@property LSICurrentWeatherChildViewController *currentWeatherVC;
@property LSIHourlyChildViewController *hourlyCollectionVC;
@property (nonatomic) WeatherFetcher *weatherFetcher;

// MARK: - Outlets
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;

@end

// NOTE: You must declare the Category before the main implementation,
// otherwise you'll see errors about the type not being correct if you
// try to move delegate methods out of the main implementation body
@interface LSIWeatherSummaryViewController (CLLocationManagerDelegate) <CLLocationManagerDelegate>

@end

@implementation LSIWeatherSummaryViewController

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)unwindSegue {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

// MARK: - View Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    [self.toolbar setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.toolbar setShadowImage:[UIImage new] forToolbarPosition:UIBarPositionAny];

}

//https://developer.apple.com/documentation/corelocation/converting_between_coordinates_and_user-friendly_place_names
- (void)requestCurrentPlacemarkForLocation:(CLLocation *)location
                            withCompletion:(void (^)(CLPlacemark *, NSError *))completionHandler {
    if (location) {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if (error) {
                completionHandler(nil, error);
                return;
            }
            
            if (placemarks.count >= 1) {
                CLPlacemark *place = placemarks.firstObject;
                
                completionHandler(place, nil);
                return;
                
            } else {
                NSError *placeError = errorWithMessage(@"No places match current location", LSIPlaceError);
                
                completionHandler(nil, placeError);
                return;
            }
        }];
        
    } else {
        NSLog(@"ERROR: Missing location, please provide location");
    }
}

- (void)requestUserFriendlyLocation:(CLLocation *)location {
    if(!_requestedLocation) {
        _requestedLocation = YES;
        __block BOOL requestedLocation = _requestedLocation;
        
        [self requestCurrentPlacemarkForLocation:location withCompletion:^(CLPlacemark *place, NSError *error) {
            
            NSLog(@"Location: %@, %@", place.locality, place.administrativeArea);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.location = location;
                self.placemark = place;
                self.currentWeatherVC.placemark = self.placemark;
            });
            requestedLocation = NO;
        }];
    }
}

- (void)requestWeatherForLocation:(CLLocation *)location {
    
    // Getting weather data with fetcher
    self.weatherFetcher = [[WeatherFetcher alloc] init];
    [self.weatherFetcher fetchTodaysWeather:^(LSIWeatherForcast * _Nullable weatherForcast, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching today's weather: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.currentForecast = weatherForcast.currently;
            self.hourlyForecast = weatherForcast.hourly;
            self.dailyForecast = weatherForcast.daily;
            
            self.currentWeatherVC.currentForecast = self.currentForecast;
            self.hourlyCollectionVC.hourlyForecast = self.hourlyForecast;
            
            [self.tableView reloadData];
            
            NSLog(@"Current Weather Apparent Temp: %@", weatherForcast.currently.apparentTemperature);
            NSLog(@"Daily Weather Count: %d", self.dailyForecast.dailies.count);
            NSLog(@"Hourly Weather Count: %d", self.hourlyForecast.hourlies.count);
            
        });
    }];
}

- (void)updateViews {
    
//    if (self.placemark) {
//        // TODO: Update the City, State label
//        NSString *city = _placemark.locality;
//        NSString *state = _placemark.administrativeArea;
//        NSString *cityState = [NSString stringWithFormat:@"%@, %@", city, state];
//        _cityStateLabel.text = cityState;
//    }
//    // TODO: Update the UI based on the current forecast
//    // Top View
//    _iconImage.image = [LSIWeatherIcons weatherImageForIconName:_currentForecast.icon];
//    _summaryLabel.text = _currentForecast.summary;
//    _temperatureLabel.text = [NSString stringWithFormat:@"%d℉", _currentForecast.temperature.intValue];
}

// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dailyForecast.dailies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LSIDailyWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyCell" forIndexPath:indexPath];
    
    
    LSIDailyForcast *dailyWeather = [self.dailyForecast.dailies objectAtIndex:indexPath.row];
    cell.dailyForecast = dailyWeather;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"CurrentWeatherSegue"]) {
        LSICurrentWeatherChildViewController *destinationVC = segue.destinationViewController;
        
        self.currentWeatherVC = destinationVC;
        
    } else if ([segue.identifier isEqual:@"HourlyWeatherSegue"]) {
        LSIHourlyChildViewController *destinationVC = segue.destinationViewController;
        
        self.hourlyCollectionVC = destinationVC;
    }
}

@end

/// MARK: CLLocationManagerDelegate Methods

@implementation LSIWeatherSummaryViewController(CLLocationManagerDelegate)

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locationManager Error: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"locationManager: found location %@", locations.firstObject);
    
    CLLocation *location = locations.firstObject;
    
    // 1. Request Weather for location
    
    [self requestWeatherForLocation: location];
    
    // 2. Request User-Friendly Place Names for Lat/Lon coordinate
    
    [self requestUserFriendlyLocation: location];
    
    // Stop updating location after getting one (NOTE: this is faster than doing a single location request)
    [manager stopUpdatingLocation];
}

@end
