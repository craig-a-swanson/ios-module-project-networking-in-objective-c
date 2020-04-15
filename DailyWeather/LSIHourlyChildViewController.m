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
    // Do any additional setup after loading the view.
}

- (void)setHourlyForecast:(LSIHourlyForcast *)hourlyForecast {
    _hourlyForecast = hourlyForecast;
    [self.collectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    HourlyWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HourlyCell" forIndexPath:indexPath];
    
    LSIHourlyForcast *hourlyWeather = [self.hourlyForecast.hourlies objectAtIndex:indexPath.row];
    
    cell.hourlyForecast = hourlyWeather;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _hourlyForecast.hourlies.count;
}

//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
