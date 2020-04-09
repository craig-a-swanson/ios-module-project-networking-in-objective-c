//
//  LSIDailyForecast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/8/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSICurrentForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIDailyForecast : NSObject

//@property (nonatomic, readonly) NSDate *time;
//@property (nonatomic, readonly, copy) NSString *summary;
//@property (nonatomic, readonly, copy) NSString *icon;
//@property (nonatomic, readonly) NSDate *sunriseTime;
//@property (nonatomic, readonly) NSDate *sunsetTime;
//@property (nonatomic, readonly) NSNumber *precipProbability;
//@property (nonatomic, readonly) NSNumber *precipIntensity;
//@property (nonatomic, readonly, copy) NSString *precipType;
//@property (nonatomic, readonly) NSNumber *temperatureLow;
//@property (nonatomic, readonly) NSNumber *temperatureHigh;
//@property (nonatomic, readonly) NSNumber *apparentTemperatureLow;
//@property (nonatomic, readonly) NSNumber *apparentTemperatureHigh;
//@property (nonatomic, readonly) NSNumber *humidity;
//@property (nonatomic, readonly) NSNumber *pressure;
//@property (nonatomic, readonly) NSNumber *windSpeed;
//@property (nonatomic, readonly) NSNumber *windBearing;
//@property (nonatomic, readonly) NSNumber *uvIndex;
//
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
//                     uvIndex:(NSNumber *)uvIndex;
//
//- (instancetype)initWithArray:(NSArray *)array;

@property (nonatomic, readonly, copy) NSArray<LSICurrentForecast *> *dailies;

- (instancetype)initWithDailies:(NSArray<LSICurrentForecast *> *)dailies;
- (instancetype)initWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
