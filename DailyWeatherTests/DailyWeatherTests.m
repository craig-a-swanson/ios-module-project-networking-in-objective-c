//
//  DailyWeatherTests.m
//  DailyWeatherTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSICurrentWeather.h"
#import "LSIDailyForcast.h"
#import "LSIWeatherForcast.h"
#import "LSIHourlyForcast.h"

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
    
    LSIDailyForcast *dailyForecast = [[LSIDailyForcast alloc] initWithArray:json];
    XCTAssertNotNil(dailyForecast);
    XCTAssertEqual(8, dailyForecast.dailies.count);
    
    LSIDailyForcast *dayTwo = dailyForecast.dailies[1];
    XCTAssertEqual(4.44, dayTwo.windSpeed.doubleValue);

}

- (void)testHourlyWeatherParse {
    
    NSData *hourlyData = loadFile(@"HourlyWeather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:hourlyData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@:", jsonError);
    }
    
    LSIHourlyForcast *hourlyForecast = [[LSIHourlyForcast alloc] initWithArray:json];
    XCTAssertNotNil(hourlyForecast);
    XCTAssertEqual(49, hourlyForecast.hourlies.count);
    XCTAssertEqual(2.86, hourlyForecast.hourlies[3].windSpeed.doubleValue);
}

- (void)testHourlyPrecipTypeIsNull {
    
    NSData *hourlyData = loadFile(@"HourlyWeather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:hourlyData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON Parsing error: %@:", jsonError);
    }
    
    LSIHourlyForcast *hourlyForecast = [[LSIHourlyForcast alloc] initWithArray:json];
    XCTAssertNil(hourlyForecast.hourlies[0].precipType);
}

- (void)testDailyWeatherParseWithWeatherJSON {
    
    NSData *weatherData = loadFile(@"Weather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:weatherData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON error parsing daily weather: %@", jsonError);
    }
    
    LSIWeatherForcast *dailyForecast = [[LSIWeatherForcast alloc] initWithDailyDictionary:json];
    XCTAssertEqual(8, dailyForecast.daily.dailies.count);
    XCTAssertEqual(64.8, dailyForecast.daily.dailies[4].apparentTemperatureHigh.doubleValue);
}

- (void)testHourlyWeatherParseWithWeatherJSON {
    
    NSData *weatherData = loadFile(@"Weather.json", [DailyWeatherTests class]);
    
    NSError *jsonError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:weatherData options:0 error:&jsonError];
    if (jsonError) {
        NSLog(@"JSON error parsing hourly weather %@:", jsonError);
    }
    
    LSIWeatherForcast *hourlyForcast = [[LSIWeatherForcast alloc] initWithHourlyDictionary:json];
    
    XCTAssertEqual(49, hourlyForcast.hourly.hourlies.count);
    XCTAssertTrue([hourlyForcast.hourly.hourlies[48].icon isEqualToString:@"partly-cloudy-night"]);
    
}

@end
