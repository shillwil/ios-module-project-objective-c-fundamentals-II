//
//  WASTimedTaskController.m
//  TimeTracker
//
//  Created by Alex Shillingford on 5/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "WASTimedTaskController.h"

@implementation WASTimedTaskController

- (instancetype)init
{
    if(self = [super init]) {
        _tasksArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createTimedTaskWithClient:(NSString *)aClient
                      workSummary:(NSString *)aWorkSummary
                       hourlyRate:(double)anHourlyRate
                      hoursWorked:(double)theHoursWorked
{
    WASTimedTask *newTask = [[WASTimedTask alloc] initWithClient:aClient workSummary:aWorkSummary hourlyRate:anHourlyRate hoursWorked:theHoursWorked];
    
    [_tasksArray addObject:newTask];
}

- (void)updateTimedTaskWithClient:(NSString *)aClient
                      workSummary:(NSString *)aWorkSummary
                       hourlyRate:(double)anHourlyRate
                      hoursWorked:(double)theHoursWorked
                            index:(NSInteger)anIndex
{
    WASTimedTask *replacementTask = [[WASTimedTask alloc] initWithClient:aClient workSummary:aWorkSummary hourlyRate:anHourlyRate hoursWorked:theHoursWorked];
    
    [_tasksArray replaceObjectAtIndex:anIndex withObject:replacementTask];
}

@end
