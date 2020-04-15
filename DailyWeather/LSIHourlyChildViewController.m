//
//  LSIHourlyChildViewController.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIHourlyChildViewController.h"
#import "HourlyWeatherCollectionViewCell.h"
#import "LSIHourlyForcast.h"

@interface LSIHourlyChildViewController ()

// MARK: - Outlets
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation LSIHourlyChildViewController

@synthesize hourlyForecast = _hourlyForecast;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setHourlyForecast:(LSIHourlyForcast *)hourlyForecast {
    _hourlyForecast = hourlyForecast;
    [self.collectionView reloadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    HourlyWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HourlyCell" forIndexPath:indexPath];
    
    LSIHourlyForcast *hourlyWeather = [self.hourlyForecast.hourlies objectAtIndex:indexPath.row];
    
    cell.hourlyForecast = hourlyWeather;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _hourlyForecast.hourlies.count;
}

@end
