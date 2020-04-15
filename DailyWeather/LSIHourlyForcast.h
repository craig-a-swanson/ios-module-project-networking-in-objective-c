//
//  LSIHourlyForcast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/12/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIWeatherForcast.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIHourlyForcast : LSIWeatherForcast

@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly, copy) NSString *summary;
@property (nonatomic, readonly, copy) NSString *icon;
@property (nonatomic, readonly) NSNumber *precipProbability;
@property (nonatomic, readonly) NSNumber *precipIntensity;
@property (nonatomic, readonly, copy) NSString *precipType;
@property (nonatomic, readonly) NSNumber *temperatureLow;
@property (nonatomic, readonly) NSNumber *temperature;
@property (nonatomic, readonly) NSNumber *apparentTemperatureLow;
@property (nonatomic, readonly) NSNumber *apparentTemperatureHigh;
@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSNumber *pressure;
@property (nonatomic, readonly) NSNumber *windSpeed;
@property (nonatomic, readonly) NSNumber *windBearing;
@property (nonatomic, readonly) NSNumber *uvIndex;
@property (nonatomic, readonly) NSArray<LSIHourlyForcast *> *hourlies;

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
                     uvIndex:(NSNumber *)uvIndex;

- (instancetype)initWithHourlies:(NSArray<LSIHourlyForcast *> *)hourlies;
- (instancetype)initWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
