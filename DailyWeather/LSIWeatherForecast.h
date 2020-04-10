//
//  LSIWeatherForecast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSICurrentForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForecast : NSObject

@property (nonatomic) LSICurrentForecast *currently;
@property (nonatomic, copy) NSArray<LSICurrentForecast *> *daily;
@property (nonatomic, copy) NSArray<LSICurrentForecast *> *hourly;

- (instancetype)initWithCurrently:(NSDictionary *)currently;
- (instancetype)initWithDaily:(NSArray<LSICurrentForecast *> *)daily
                       hourly:(NSArray<LSICurrentForecast *> *)hourly;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// create initializers for the three properties
// although the currentforecast is easiest, when we actually do a network request, it will be in this "weatherforecast" format, so we need to use the parsing here to create the different objects. We won't be able to simply load the "currentweather.json" file and parse that. We need to download the entire "weather" JSON and parse that.



@end

NS_ASSUME_NONNULL_END
