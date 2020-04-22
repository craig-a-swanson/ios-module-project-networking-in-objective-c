//
//  WeatherFetcher.m
//  DailyWeather
//
//  Created by Craig Swanson on 4/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "WeatherFetcher.h"
#import "LSIWeatherForcast.h"
#import "LSIErrors.h"

static NSString *baseURLString = @"https://api.darksky.net/forecast/8442b4704392a33af8e79690658ce477/44.6712,-93.6294";

@interface WeatherFetcher ()
    
@property (nonatomic) LSIWeatherForcast *completeForecast;

@end

@implementation WeatherFetcher

- (void)fetchTodaysWeather:(LSIWeatherForcastCompletion)completion {
    
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:baseURLString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = errorWithMessage(@"Data is nil from API response", LSIDataNilError);
            completion(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        // The json data returned from the data task is used in three separate method calls, one call for each object (current, hourly, daily)
        // A separate initializer is then called to combine the three objects into one LSIWeatherForecast object that is returned to the caller.
        LSIWeatherForcast *currentWeather = [[LSIWeatherForcast alloc] initWithCurrentDictionary:jsonData];
        LSIWeatherForcast *hourlyWeather = [[LSIWeatherForcast alloc] initWithHourlyDictionary:jsonData];
        LSIWeatherForcast *dailyWeather = [[LSIWeatherForcast alloc] initWithDailyDictionary:jsonData];

        LSIWeatherForcast *completeForecast = [[LSIWeatherForcast alloc] initWithCompleteForecast:currentWeather.currently daily:dailyWeather.daily hourly:hourlyWeather.hourly];
        
        completion(completeForecast, nil);
    }];
    [task resume];
}

@end
