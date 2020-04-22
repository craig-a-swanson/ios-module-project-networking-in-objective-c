//
//  WeatherFetcher.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSIWeatherForcast;

typedef void (^LSIWeatherForcastCompletion)(LSIWeatherForcast * _Nullable weatherForcast, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface WeatherFetcher : NSObject

- (void)fetchTodaysWeather:(LSIWeatherForcastCompletion)completion;

@end

NS_ASSUME_NONNULL_END
