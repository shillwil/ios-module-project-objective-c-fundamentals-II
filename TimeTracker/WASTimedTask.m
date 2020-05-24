//
//  WASTimedTask.m
//  TimeTracker
//
//  Created by Alex Shillingford on 5/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "WASTimedTask.h"

@implementation WASTimedTask

- (instancetype)initWithClient:(NSString *)aClient
                   workSummary:(NSString *)aWorkSummary
                    hourlyRate:(double)anHourlyRate
                   hoursWorked:(double)theHoursWorked
{
    if(self = [super init]) {
        _client = aClient;
        _workSummary = aWorkSummary;
        _hourlyRate = anHourlyRate;
        _hoursWorked = theHoursWorked;
    }
    return self;
}

-(double)totalAmountDue
{
    return self.hoursWorked * self.hourlyRate;
}

@end
