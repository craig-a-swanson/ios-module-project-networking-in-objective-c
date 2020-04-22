//
//  LSIWeatherSummaryViewController.h
//  DailyWeather
//
//  Created by Craig Swanson on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LSILocationHandler)(CLPlacemark *placemark, NSError *error);

@interface LSIWeatherSummaryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

//- (void)requestCurrentLocationWithCompletion:(LSILocationHandler)completionHandler;
- (void)requestCurrentPlacemarkForLocation:(CLLocation *)location
                            withCompletion:(void (^)(CLPlacemark *, NSError *))completionHandler;


- (void)requestWeatherForLocation:(CLLocation *)location;


@end

