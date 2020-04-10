//
//  LSIWeatherForecast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

/*
 This was the one I'm not too confident about. My theory was
 to call the initializer in the other models (eg, DailyForecast)
 using the Weather.json file, and then use the object returned to
 set the properties here. For example, call the daily forecast
 initializer with the appropriate array from weather.json and set
 the value to be of type LSIDailyForcast. Then set the "daily" property
 in this object to the value that was returned from the daily forecast
 object. It works but I'm not sure it's the preferred way. A big
 question mark is because I had to delete the "copy" parameters for
 the properties in this object. I was getting an error and a crash
 when I had "copy" as a parameter. Something about "copyWithZone:]:
 unrecognized selector sent to instance"
 */

#import <Foundation/Foundation.h>

@class LSICurrentForecast;
@class LSIDailyForecast;
@class LSIHourlyForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForecast : NSObject

@property (nonatomic) LSICurrentForecast *currently;
@property (nonatomic) LSIDailyForecast *daily;
@property (nonatomic) LSIHourlyForecast *hourly;

- (instancetype)initWithCurrentDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDailyDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithHourlyDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
