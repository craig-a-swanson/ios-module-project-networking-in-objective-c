//
//  LSIHourlyForcast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/12/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIHourlyForcast.h"

@implementation LSIHourlyForcast

- (instancetype)initWithTime:(NSDate *)time
                     summary:(NSString *)summary
                        icon:(NSString *)icon
           precipProbability:(NSNumber *)precipProbability
             precipIntensity:(NSNumber *)precipIntensity
                  precipType:(NSString *)precipType
              temperatureLow:(NSNumber *)temperatureLow
             temperature:(NSNumber *)temperature
      apparentTemperatureLow:(NSNumber *)apparentTemperatureLow
     apparentTemperatureHigh:(NSNumber *)apparentTemperatureHigh
                    humidity:(NSNumber *)humidity
                    pressure:(NSNumber *)pressure
                   windSpeed:(NSNumber *)windSpeed
                 windBearing:(NSNumber *)windBearing
                     uvIndex:(NSNumber *)uvIndex {
    if (self = [super init]) {
        _time = time;
        _summary = summary;
        _icon = icon;
        _precipProbability = precipProbability;
        _precipIntensity = precipIntensity;
        _precipType = precipType;
        _temperatureLow = temperatureLow;
        _temperature = temperature;
        _apparentTemperatureLow = apparentTemperatureLow;
        _apparentTemperatureHigh = apparentTemperatureHigh;
        _humidity = humidity;
        _pressure = pressure;
        _windSpeed = windSpeed;
        _windBearing = windBearing;
        _uvIndex = uvIndex;
    }
    return self;
}

- (instancetype)initWithHourlies:(NSArray<LSIHourlyForcast *> *)hourlies {
    if (self = [super init]) {
        _hourlies = hourlies;
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    NSArray *hourlyDictionaries = array;
    NSMutableArray *hourliesArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in hourlyDictionaries) {
        NSNumber *timeNumber = dictionary[@"time"];
        NSString *summary = dictionary[@"summary"];
        NSString *icon = dictionary[@"icon"];
        NSNumber *precipProbability = dictionary[@"precipProbability"];
        NSNumber *precipIntensity = dictionary[@"precipIntensity"];
        NSString *precipType = dictionary[@"precipType"];
        NSNumber *temperatureLow = dictionary[@"temperatureLow"];
        NSNumber *temperature = dictionary[@"temperature"];
        NSNumber *apparentTemperatureLow = dictionary[@"apparentTemperatureLow"];
        NSNumber *apparentTemperatureHigh = dictionary[@"apparentTemperatureHigh"];
        NSNumber *humidity = dictionary[@"humidity"];
        NSNumber *pressure = dictionary[@"pressure"];
        NSNumber *windSpeed = dictionary[@"windSpeed"];
        NSNumber *windBearing = dictionary[@"windBearing"];
        NSNumber *uvIndex = dictionary[@"uvIndex"];
        
        if (!timeNumber) {
            return nil;
        }
        NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeNumber.longValue];
        
        if ([summary isKindOfClass:[NSNull class]]) {
            summary = nil;
        }
        if ([icon isKindOfClass:[NSNull class]]) {
            icon = nil;
        }
        if ([precipProbability isKindOfClass:[NSNull class]]) {
            precipProbability = nil;
        }
        if ([precipIntensity isKindOfClass:[NSNull class]]) {
            precipIntensity = nil;
        }
        if ([humidity isKindOfClass:[NSNull class]]) {
            humidity = nil;
        }
        if ([pressure isKindOfClass:[NSNull class]]) {
            pressure = nil;
        }
        if ([windSpeed isKindOfClass:[NSNull class]]) {
            windSpeed = nil;
        }
        if ([windBearing isKindOfClass:[NSNull class]]) {
            windBearing = nil;
        }
        if ([uvIndex isKindOfClass:[NSNull class]]) {
            uvIndex = nil;
        }
        if ([precipType isKindOfClass:[NSNull class]]) {
            precipType = nil;
        }
        if ([temperatureLow isKindOfClass:[NSNull class]]) {
            temperatureLow = nil;
        }
        if ([temperature isKindOfClass:[NSNull class]]) {
            temperature = nil;
        }
        if ([apparentTemperatureLow isKindOfClass:[NSNull class]]) {
            apparentTemperatureLow = nil;
        }
        if ([apparentTemperatureHigh isKindOfClass:[NSNull class]]) {
            apparentTemperatureHigh = nil;
        }
        LSIHourlyForcast *newHourlyForcast = [[LSIHourlyForcast alloc] initWithTime:time summary:summary icon:icon precipProbability:precipProbability precipIntensity:precipIntensity precipType:precipType temperatureLow:temperatureLow temperature:temperature apparentTemperatureLow:apparentTemperatureLow apparentTemperatureHigh:apparentTemperatureHigh humidity:humidity pressure:pressure windSpeed:windSpeed windBearing:windBearing uvIndex:uvIndex];
        
        [hourliesArray addObject:newHourlyForcast];
    }
    self = [self initWithHourlies:hourliesArray];
    return self;
}

@end
