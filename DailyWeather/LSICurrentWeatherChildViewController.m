//
//  LSICurrentWeatherChildViewController.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LSIWeatherIcons.h"
#import "LSICurrentWeatherChildViewController.h"
#import "LSICurrentWeather.h"
#import "LSIWeatherSummaryViewController.h"

@interface LSICurrentWeatherChildViewController ()

// MARK: - Outlets
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation LSICurrentWeatherChildViewController

@synthesize currentForecast = _currentForecast;
@synthesize placemark = _placemark;

- (void)setCurrentForecast:(LSICurrentWeather *)currentForecast {
    _currentForecast = currentForecast;
    [self updateViews];
}

- (void)setPlacemark:(CLPlacemark *)placemark {
    _placemark = placemark;
    [self updateViews];
}

- (void)updateViews {
    if (self.placemark) {
        NSString *city = _placemark.locality;
        NSString *state = _placemark.administrativeArea;
        NSString *cityState = [NSString stringWithFormat:@"%@, %@", city, state];
        _cityStateLabel.text = cityState;
    }
    _iconImage.image = [LSIWeatherIcons weatherImageForIconName:_currentForecast.icon];
    _summaryLabel.text = _currentForecast.summary;
    _temperatureLabel.text = [NSString stringWithFormat:@"%d℉", _currentForecast.temperature.intValue];
}

@end
