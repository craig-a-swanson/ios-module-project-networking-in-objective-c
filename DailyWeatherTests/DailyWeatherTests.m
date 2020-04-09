//
//  DailyWeatherTests.m
//  DailyWeatherTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSICurrentForecast.h"
#import "LSIDailyForecast.h"

@interface DailyWeatherTests : XCTestCase

@end

@implementation DailyWeatherTests

- (void)testExample {

    // TODO: Use LSIFileHelper to load JSON from your test bundle
    NSData *dailyData = loadFile(@"DailyWeather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:dailyData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@:", jsonError);
    }
    
    LSIDailyForecast *dailyForecast = [[LSIDailyForecast alloc] initWithArray:json];
    XCTAssertNotNil(dailyForecast);
    XCTAssertEqual(8, dailyForecast.dailies.count);
    
    LSICurrentForecast *dayTwo = dailyForecast.dailies[1];
    XCTAssertEqual(4.44, dayTwo.windSpeed.doubleValue);

    
    // TODO: Create Unit Tests for each separate JSON file

}

@end
