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
#import "LSIWeatherForecast.h"

@interface DailyWeatherTests : XCTestCase

@end

@implementation DailyWeatherTests

- (void)testDailyWeatherParse {

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

- (void)testHourlyWeatherParse {
    
    NSData *hourlyData = loadFile(@"HourlyWeather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:hourlyData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@:", jsonError);
    }
    
    LSIDailyForecast *hourlyForecast = [[LSIDailyForecast alloc] initWithArray:json];
    XCTAssertNotNil(hourlyForecast);
    XCTAssertEqual(49, hourlyForecast.dailies.count);
    
    LSICurrentForecast *hourFour = hourlyForecast.dailies[3];
    XCTAssertEqual(2.86, hourFour.windSpeed.doubleValue);
}

- (void)testHourlyPrecipTypeIsNull {
    
    NSData *hourlyData = loadFile(@"HourlyWeather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:hourlyData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@:", jsonError);
    }
    
    LSIDailyForecast *hourlyForecast = [[LSIDailyForecast alloc] initWithArray:json];
    LSICurrentForecast *hourOne = hourlyForecast.dailies[0];
    XCTAssertNil(hourOne.precipType);
}

- (void)testDailyWeatherParseWithWeatherJSON {
    
//    LSIWeatherForecast *weatherForecast = [[LSIWeatherForecast alloc] init];
    
    NSData *weatherData = loadFile(@"Weather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:weatherData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON error parsing daily weather: %@", jsonError);
    }
    
    LSIWeatherForecast *dailyForecast = [[LSIWeatherForecast alloc] initWithDailyDictionary:json];
    XCTAssertEqual(8, dailyForecast.daily.dailies.count);
    XCTAssertEqual(64.8, dailyForecast.daily.dailies[4].apparentTemperatureHigh.doubleValue);
    
}

@end
