//
//  LSIHourlyForecast.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/9/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSICurrentForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIHourlyForecast : NSObject

@property (nonatomic, readonly, copy) NSArray<LSICurrentForecast *> *hourlies;

- (instancetype)initWithHourlies:(NSArray<LSICurrentForecast *> *)hourlies;
- (instancetype)initWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
