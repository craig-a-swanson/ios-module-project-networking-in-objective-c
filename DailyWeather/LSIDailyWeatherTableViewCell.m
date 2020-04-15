//
//  LSIDailyWeatherTableViewCell.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIDailyWeatherTableViewCell.h"
#import "LSIDailyForcast.h"
#import "LSIWeatherIcons.h"

@interface LSIDailyWeatherTableViewCell ()

// MARK: - Outlets

@property (strong, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *highTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowTempLabel;

@end

@implementation LSIDailyWeatherTableViewCell

@synthesize dailyForecast = _dailyForecast;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDailyForecast:(LSIDailyForcast *)dailyForecast {
    _dailyForecast = dailyForecast;
    [self updateViews];
}

- (void)updateViews {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateString = [dateFormatter stringFromDate:_dailyForecast.time];
    
    _dayOfWeekLabel.text = dateString;
    _icon.image = [LSIWeatherIcons weatherImageForIconName:_dailyForecast.icon];
    _highTempLabel.text = [NSString stringWithFormat:@"%d°", _dailyForecast.temperatureHigh.intValue];
    _lowTempLabel.text = [NSString stringWithFormat:@"%d°", _dailyForecast.temperatureLow.intValue];
}

@end
