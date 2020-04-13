//
//  LSIWeatherForcast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

// This is the second version of my solution. The other version also worked but put all of the model properties in the "CurrentWeather" object and made that object the base object for the others.  For example, in that version the hourly forecast was an array of CurrentWeather objects. In this version, each object is a child of LSIWeatherForcast and each child has its own properties.  I have a feeling that neither version is exactly right, as neither feels all that intuitive or efficient.

// The LSIWeatherForcast file creates a separate initializer for each property. The initializer takes the weather.json file and passes the relevant content to appropriate child, which parses it. The parsed results are then saved here and initialized to the property (currently, daily, hourly).

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
