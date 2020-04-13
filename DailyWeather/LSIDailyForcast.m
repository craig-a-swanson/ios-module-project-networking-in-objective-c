//
//  LSIDailyForcast.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/12/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIDailyForcast.h"

@implementation LSIDailyForcast

- (instancetype)initWithTime:(NSDate *)time
                     summary:(NSString *)summary
                        icon:(NSString *)icon
                 sunriseTime:(NSDate *)sunriseTime
                  sunsetTime:(NSDate *)sunsetTime
           precipProbability:(NSNumber *)precipProbability
             precipIntensity:(NSNumber *)precipIntensity
                  precipType:(NSString *)precipType
              temperatureLow:(NSNumber *)temperatureLow
             temperatureHigh:(NSNumber *)temperatureHigh
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
        _sunriseTime = sunriseTime;
        _sunsetTime = sunsetTime;
        _precipProbability = precipProbability;
        _precipIntensity = precipIntensity;
        _precipType = precipType;
        _temperatureLow = temperatureLow;
        _temperatureHigh = temperatureHigh;
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

- (instancetype)initWithDailies:(NSArray<LSIDailyForcast *> *)dailies {
    if (self = [super init]) {
        _dailies = dailies;
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    NSArray *dailyDictionaries = array;
    NSMutableArray *dailiesArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in dailyDictionaries) {
    NSNumber *timeNumber = dictionary[@"time"];
    NSString *summary = dictionary[@"summary"];
    NSString *icon = dictionary[@"icon"];
    NSNumber *sunriseTimeNumber = dictionary[@"sunriseTime"];
    NSNumber *sunsetTimeNumber = dictionary[@"sunsetTime"];
    NSNumber *precipProbability = dictionary[@"precipProbability"];
    NSNumber *precipIntensity = dictionary[@"precipIntensity"];
    NSString *precipType = dictionary[@"precipType"];
    NSNumber *temperatureLow = dictionary[@"temperatureLow"];
    NSNumber *temperatureHigh = dictionary[@"temperatureHigh"];
    NSNumber *apparentTemperatureLow = dictionary[@"apparentTemperatureLow"];
    NSNumber *apparentTemperatureHigh = dictionary[@"apparentTemperatureHigh"];
    NSNumber *humidity = dictionary[@"humidity"];
    NSNumber *pressure = dictionary[@"pressure"];
    NSNumber *windSpeed = dictionary[@"windSpeed"];
    NSNumber *windBearing = dictionary[@"windBearing"];
    NSNumber *uvIndex = dictionary[@"uvIndex"];
    
    /*
     I don't know if this was necessary or not, but since each property except "time"
     is optional according to the documentation on the website, I specifically set
     each one to nil if the JSON returns null.
     */
    
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
    if (!sunriseTimeNumber) {
        _sunriseTime = nil;
    } else {
        _sunriseTime = [NSDate dateWithTimeIntervalSince1970:sunriseTimeNumber.longValue];
    }
    if (!sunsetTimeNumber) {
        _sunsetTime = nil;
    } else {
        _sunsetTime = [NSDate dateWithTimeIntervalSince1970:sunsetTimeNumber.longValue];
    }
    if ([precipType isKindOfClass:[NSNull class]]) {
        precipType = nil;
    }
    if ([temperatureLow isKindOfClass:[NSNull class]]) {
        temperatureLow = nil;
    }
    if ([temperatureHigh isKindOfClass:[NSNull class]]) {
        temperatureHigh = nil;
    }
    if ([apparentTemperatureLow isKindOfClass:[NSNull class]]) {
        apparentTemperatureLow = nil;
    }
    if ([apparentTemperatureHigh isKindOfClass:[NSNull class]]) {
        apparentTemperatureHigh = nil;
    }
        LSIDailyForcast *newDailyForcast = [[LSIDailyForcast alloc] initWithTime:time summary:summary icon:icon sunriseTime:_sunriseTime sunsetTime:_sunsetTime precipProbability:precipProbability precipIntensity:precipIntensity precipType:precipType temperatureLow:temperatureLow temperatureHigh:temperatureHigh apparentTemperatureLow:apparentTemperatureLow apparentTemperatureHigh:apparentTemperatureHigh humidity:humidity pressure:pressure windSpeed:windSpeed windBearing:windBearing uvIndex:uvIndex];
        
        [dailiesArray addObject:newDailyForcast];
    }
    self = [self initWithDailies:dailiesArray];
    return self;
}


@end
