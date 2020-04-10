//
//  LSIWeatherForecast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIWeatherForecast.h"
#import "LSICurrentForecast.h"
#import "LSIHourlyForecast.h"
#import "LSIDailyForecast.h"

@implementation LSIWeatherForecast

- (instancetype)initWithCurrentDictionary:(NSDictionary *)dictionary {
    NSDictionary *currentDictionary = dictionary[@"currently"];
    
    LSICurrentForecast *currentWeather = [[LSICurrentForecast alloc] initWithDictionary:currentDictionary];
    
    self.currently = currentWeather;
    return self;
}

- (instancetype)initWithDailyDictionary:(NSDictionary *)dictionary {
    NSDictionary *dailyDictionary = dictionary[@"daily"];
    NSArray *dailyArray = dailyDictionary[@"data"];
    
    LSIDailyForecast *dailyWeatherForecast = [[LSIDailyForecast alloc] initWithArray:dailyArray];
    
    self.daily = dailyWeatherForecast;
    return self;
}

- (instancetype)initWithHourlyDictionary:(NSDictionary *)dictionary {
    NSDictionary *hourlyDictionary = dictionary[@"hourly"];
    NSArray *hourlyArray = hourlyDictionary[@"data"];
    
    LSIHourlyForecast *hourlyWeatherForecast = [[LSIHourlyForecast alloc] initWithArray:hourlyArray];
    
    self.hourly = hourlyWeatherForecast;
    return self;
}

@end
