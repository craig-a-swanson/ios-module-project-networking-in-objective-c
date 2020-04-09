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

@property (nonatomic, readonly, copy) NSArray<LSICurrentForecast *> *dailies;

- (instancetype)initWithDailies:(NSArray<LSICurrentForecast *> *)dailies;
- (instancetype)initWithArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
