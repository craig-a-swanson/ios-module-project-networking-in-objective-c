//
//  LSIWeatherForcast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/11/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIWeatherForcast.h"
#import "LSICurrentWeather.h"
#import "LSIDailyForcast.h"
#import "LSIHourlyForcast.h"

@implementation LSIWeatherForcast

- (instancetype)initWithCurrents:(LSICurrentWeather *)currently {
    if (self = [super init]) {
        _currently = currently;
    }
    return self;
}

- (instancetype)initWithDailies:(LSIDailyForcast *)daily {
    if (self = [super init]) {
        _daily = daily;
    }
    return self;
}

- (instancetype)initWithHourlies:(LSIHourlyForcast *)hourly {
    if (self = [super init]) {
        _hourly = hourly;
    }
    return self;
}

- (instancetype)initWithCurrentDictionary:(NSDictionary *)dictionary {
    NSDictionary *currentDictionary = dictionary[@"currently"];
    
    LSICurrentWeather *currentWeather = [[LSICurrentWeather alloc] initWithDictionary:currentDictionary];
    
    self = [self initWithCurrents:currentWeather];
    return self;
}

- (instancetype)initWithDailyDictionary:(NSDictionary *)dictionary {
    NSDictionary *dailyDictionary = dictionary[@"daily"];
    NSArray *dailyArray = dailyDictionary[@"data"];
    
    LSIDailyForcast *dailyWeatherForecast = [[LSIDailyForcast alloc] initWithArray:dailyArray];
    
//    self = [self initWithDailies:dailyWeatherForecast];
    return dailyWeatherForecast;
}

- (instancetype)initWithHourlyDictionary:(NSDictionary *)dictionary {
    NSDictionary *hourlyDictionary = dictionary[@"hourly"];
    NSArray *hourlyArray = hourlyDictionary[@"data"];
    
    LSIHourlyForcast *hourlyWeatherForcast = [[LSIHourlyForcast alloc] initWithArray:hourlyArray];
    
    self = [self initWithHourlies:hourlyWeatherForcast];
    return self;
}

- (instancetype)initWithCompleteForecast:(LSICurrentWeather *)currently daily:(LSIDailyForcast *)daily hourly:(LSIHourlyForcast *)hourly {
    if (self = [self init]) {
        _currently = currently;
        _hourly = hourly;
        _daily = daily;
    }
    return self;
}

@end
