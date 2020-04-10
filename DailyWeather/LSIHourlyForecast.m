//
//  LSIHourlyForecast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIHourlyForecast.h"
#import "LSICurrentForecast.h"

@implementation LSIHourlyForecast

- (instancetype)initWithHourlies:(NSArray<LSICurrentForecast *> *)hourlies {
    self = [super init];
    if (self) {
        _hourlies = [hourlies copy];
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    // here we would need to get the "hourly" dictionary and then the "data" array
    NSArray *hourlyDictionaries = array;
    NSMutableArray<LSICurrentForecast *> *hourlies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *hourlyDictionary in hourlyDictionaries) {
        LSICurrentForecast *hourly = [[LSICurrentForecast alloc] initWithDictionary:hourlyDictionary];
        if (hourly) {
            [hourlies addObject:hourly];
        } else {
            NSLog(@"Unable to parse Hourly Weather dictionary: %@", hourlyDictionary);
        }
    }
    self = [self initWithHourlies:hourlies];
    return self;
}

@end
