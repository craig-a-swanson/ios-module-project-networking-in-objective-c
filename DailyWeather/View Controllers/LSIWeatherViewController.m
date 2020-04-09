//
//  LSIWeatherViewController.m
//
//  Created by Paul Solt on 2/6/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LSIWeatherViewController.h"
#import "LSIWeatherIcons.h"
#import "LSICardinalDirection.h"
#import "LSIFileHelper.h"
#import "LSIErrors.h"
#import "LSILog.h"
#import "LSICurrentForecast.h"

@interface LSIWeatherViewController () {
    BOOL _requestedLocation;
}

// MARK: - Properties
@property CLLocationManager *locationManager;
@property CLLocation *location;
@property (nonatomic) CLPlacemark *placemark;
@property (nonatomic) LSICurrentForecast *currentForecast;

// MARK: - Outlets
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (strong, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (strong, nonatomic) IBOutlet UILabel *apparentTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *pressureLabel;
@property (strong, nonatomic) IBOutlet UILabel *precipProbabilityLabel;
@property (strong, nonatomic) IBOutlet UILabel *uvIndexLabel;


@end

// NOTE: You must declare the Category before the main implementation,
// otherwise you'll see errors about the type not being correct if you
// try to move delegate methods out of the main implementation body
@interface LSIWeatherViewController (CLLocationManagerDelegate) <CLLocationManagerDelegate>

@end


@implementation LSIWeatherViewController

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
    
    // TODO: Transparent toolbar with info button (Settings)
    // TODO: Handle settings button pressed
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
                [self updateViews];
            });
            requestedLocation = NO;
        }];
    }
}

- (void)requestWeatherForLocation:(CLLocation *)location {
    
    // TODO: 1. Parse CurrentWeather.json from App Bundle and update UI
    NSData *data = loadFile(@"CurrentWeather.json", [LSIWeatherViewController class]);
    
    NSError *error = nil;
    NSDictionary *currentWeatherJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"Error parsing json: %@", error);
    }
    LSICurrentForecast *currentWeather = [[LSICurrentForecast alloc] initWithDictionary:currentWeatherJson];
    
    self.currentForecast = currentWeather;
    [self updateViews];
    
    
    
    // TODO: 2. Refactor and Parse Weather.json from App Bundle and update UI
    NSData *weatherData = loadFile(@"Weather.json", [LSIWeatherViewController class]);
    
    NSError *weatherError = nil;
    
    
}

- (void)updateViews {
    if (self.placemark) {
        // TODO: Update the City, State label
        NSString *city = _placemark.locality;
        NSString *state = _placemark.administrativeArea;
        NSString *cityState = [NSString stringWithFormat:@"%@, %@", city, state];
        _cityStateLabel.text = cityState;
    }
    // TODO: Update the UI based on the current forecast
    // Top View
    _iconImage.image = [LSIWeatherIcons weatherImageForIconName:_currentForecast.icon];
    _summaryLabel.text = _currentForecast.summary;
    _temperatureLabel.text = [NSString stringWithFormat:@"%d℉", _currentForecast.temperature.intValue];
    
    // Bottom View
    NSString *bearing = [LSICardinalDirection directionForHeading:_currentForecast.windBearing.doubleValue];
    NSString *windData = [NSString stringWithFormat:@"%@ %dmph", bearing, _currentForecast.windSpeed.intValue];
    _windSpeedLabel.text = windData;
    _apparentTempLabel.text = [NSString stringWithFormat:@"%d℉", _currentForecast.apparentTemperature.intValue];
    double humidityDouble = (_currentForecast.humidity.doubleValue * 100.0);
    _humidityLabel.text = [NSString stringWithFormat:@"%0.0f%%", humidityDouble];
    double inchesMercury = (_currentForecast.pressure.doubleValue * 0.029529980);
    _pressureLabel.text = [NSString stringWithFormat:@"%0.2f inHG", inchesMercury];
    double precipChanceDouble = (_currentForecast.precipProbability.doubleValue * 100.0);
    _precipProbabilityLabel.text = [NSString stringWithFormat:@"%0.0f%%", precipChanceDouble];
    _uvIndexLabel.text = [NSString stringWithFormat:@"%@", _currentForecast.uvIndex];
    
    
}

@end

/// MARK: CLLocationManagerDelegate Methods

@implementation LSIWeatherViewController(CLLocationManagerDelegate)

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
