//
//  LSIDailyForecast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/8/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIDailyForecast.h"
#import "LSICurrentForecast.h"

@implementation LSIDailyForecast

- (instancetype)initWithDailies:(NSArray<LSICurrentForecast *> *)dailies {
    self = [super init];
    if (self) {
        _dailies = [dailies copy];
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    NSArray *dailyDictionaries = array;
    NSMutableArray<LSICurrentForecast *> *dailies = [[NSMutableArray alloc] init];

    for (NSDictionary *dailyDictionary in dailyDictionaries) {
        LSICurrentForecast *daily = [[LSICurrentForecast alloc] initWithDictionary:dailyDictionary];
        if (daily) {
            [dailies addObject:daily];
        } else {
            NSLog(@"Unable to parse Daily Weather dictionary: %@", dailyDictionary);
        }
    }
    self = [self initWithDailies:dailies];
    return self;
}

@end
