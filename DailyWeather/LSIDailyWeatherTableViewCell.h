//
//  LSIDailyWeatherTableViewCell.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSIDailyForcast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIDailyWeatherTableViewCell : UITableViewCell

@property (strong, nonatomic) LSIDailyForcast *dailyForecast;

@end

NS_ASSUME_NONNULL_END
