//
//  HourlyWeatherCollectionViewCell.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIHourlyForcast;

NS_ASSUME_NONNULL_BEGIN

@interface HourlyWeatherCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) LSIHourlyForcast *hourlyForecast;

@end

NS_ASSUME_NONNULL_END
