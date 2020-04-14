//
//  LSICurrentWeatherChildViewController.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@class LSICurrentWeather;

NS_ASSUME_NONNULL_BEGIN

@interface LSICurrentWeatherChildViewController : UIViewController

@property (nonatomic) LSICurrentWeather *currentForecast;
@property (nonatomic) CLPlacemark *placemark;

@end

NS_ASSUME_NONNULL_END
