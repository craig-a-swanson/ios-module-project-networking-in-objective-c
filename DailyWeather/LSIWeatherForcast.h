//
//  LSIWeatherForcast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSICurrentWeather;
@class LSIDailyForcast;
@class LSIHourlyForcast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForcast : NSObject

// Properties
@property (nonatomic, readonly) LSICurrentWeather *currently;
@property (nonatomic, readonly) LSIDailyForcast *daily;
@property (nonatomic, readonly) LSIHourlyForcast *hourly;

- (instancetype)initWithCurrents:(LSICurrentWeather *)currently;
- (instancetype)initWithDailies:(LSIDailyForcast *)daily;
- (instancetype)initWithHourlies:(LSIHourlyForcast *)hourly;

- (instancetype)initWithCurrentDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDailyDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithHourlyDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
