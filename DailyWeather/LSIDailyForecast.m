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

//- (instancetype)initWithTime:(NSDate *)time
//                     summary:(NSString *)summary
//                        icon:(NSString *)icon
//                 sunriseTime:(NSDate *)sunriseTime
//                  sunsetTime:(NSDate *)sunsetTime
//           precipProbability:(NSNumber *)precipProbability
//             precipIntensity:(NSNumber *)precipIntensity
//                  precipType:(NSString *)precipType
//              temperatureLow:(NSNumber *)temperatureLow
//             temperatureHigh:(NSNumber *)temperatureHigh
//      apparentTemperatureLow:(NSNumber *)apparentTemperatureLow
//     apparentTemperatureHigh:(NSNumber *)apparentTemperatureHigh
//                    humidity:(NSNumber *)humidity
//                    pressure:(NSNumber *)pressure
//                   windSpeed:(NSNumber *)windSpeed
//                 windBearing:(NSNumber *)windBearing
//                     uvIndex:(NSNumber *)uvIndex {
//    if (self = [super init]) {
//        _time = time;
//        _summary = summary;
//        _icon = icon;
//        _sunriseTime = sunriseTime;
//        _sunsetTime = sunsetTime;
//        _precipProbability = precipProbability;
//        _precipIntensity = precipIntensity;
//        _precipType = precipType;
//        _temperatureLow = temperatureLow;
//        _temperatureHigh = temperatureHigh;
//        _apparentTemperatureLow = apparentTemperatureLow;
//        _apparentTemperatureHigh = apparentTemperatureHigh;
//        _humidity = humidity;
//        _pressure = pressure;
//        _windSpeed = windSpeed;
//        _windBearing = windBearing;
//        _uvIndex = uvIndex;
//    }
//    return self;
//}

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
