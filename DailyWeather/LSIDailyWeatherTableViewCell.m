//
//  LSIDailyWeatherTableViewCell.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIDailyWeatherTableViewCell.h"

@interface LSIDailyWeatherTableViewCell ()

// MARK: - Outlets

@property (strong, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *highTempLabel;
@property (strong, nonatomic) IBOutlet UILabel *lowTempLabel;

@end

@implementation LSIDailyWeatherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
