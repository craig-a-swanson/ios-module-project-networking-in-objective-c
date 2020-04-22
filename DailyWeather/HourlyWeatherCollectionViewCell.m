//
//  HourlyWeatherCollectionViewCell.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "HourlyWeatherCollectionViewCell.h"
#import "LSIHourlyForcast.h"
#import "LSIWeatherIcons.h"

@interface HourlyWeatherCollectionViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;

@end

@implementation HourlyWeatherCollectionViewCell

@synthesize hourlyForecast = _hourlyForecast;

-(void)setHourlyForecast:(LSIHourlyForcast *)hourlyForecast {
    _hourlyForecast = hourlyForecast;
    [self updateViews];
}

-(void)updateViews {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h a"];
    NSString *dateString = [dateFormatter stringFromDate:_hourlyForecast.time];
    
    _timeLabel.text = dateString;
    _icon.image = [LSIWeatherIcons weatherImageForIconName:_hourlyForecast.icon];
    _tempLabel.text = [NSString stringWithFormat:@"%d°", _hourlyForecast.temperature.intValue];
}

@end
