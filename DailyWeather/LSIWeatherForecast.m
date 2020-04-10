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

- (instancetype)initWithCurrently:(LSICurrentForecast *)currently {
    self = [super init];
    if (self) {
        _currently = currently;
    }
    return self;
}
- (instancetype)initWithDaily:(NSArray<LSICurrentForecast *> *)daily
                       hourly:(NSArray<LSICurrentForecast *> *)hourly {
    self = [super init];
    if (self) {
//        _currently = [currently copy];
        _daily = [daily copy];
        _hourly = [hourly copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSDictionary *currentDictionary = dictionary[@"currently"];
    
    LSICurrentForecast *currentWeather = [[LSICurrentForecast alloc] initWithDictionary:currentDictionary];
    
    self.currently = currentWeather;
    return self;
    
}

//NSDictionary *hourlyWeather = dictionary[@"hourly"];
//NSDictionary *dailyWeather = dictionary[@"daily"];
//NSArray *hourlyDetails = hourlyWeather[@"data"];
//NSArray *dailyDetails = dailyWeather[@"data"];

@end
