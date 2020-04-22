//
//  LSIWeatherForcast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

// The LSIWeatherForcast file creates a separate initializer for each property. The initializer takes the weather.json file and passes the relevant content to appropriate child, which parses it. The parsed results are then saved here and initialized to the property (currently, daily, hourly).

#import <Foundation/Foundation.h>

@class LSICurrentWeather;
@class LSIDailyForcast;
@class LSIHourlyForcast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForcast : NSObject

// Properties
@property (nonatomic) LSICurrentWeather *currently;
@property (nonatomic) LSIDailyForcast *daily;
@property (nonatomic) LSIHourlyForcast *hourly;

- (instancetype)initWithCurrents:(LSICurrentWeather *)currently;
- (instancetype)initWithDailies:(LSIDailyForcast *)daily;
- (instancetype)initWithHourlies:(LSIHourlyForcast *)hourly;

- (instancetype)initWithCurrentDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDailyDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithHourlyDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithCompleteForecast:(LSICurrentWeather *)currently
                                   daily:(LSIDailyForcast *)daily
                                  hourly:(LSIHourlyForcast *)hourly;

@end

NS_ASSUME_NONNULL_END
