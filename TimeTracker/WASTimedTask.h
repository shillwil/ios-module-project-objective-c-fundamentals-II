//
//  WASTimedTask.h
//  TimeTracker
//
//  Created by Alex Shillingford on 5/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WASTimedTask : NSObject

@property (nonatomic, readonly) NSString *client;
@property (nonatomic, readonly) NSString *workSummary;
@property (nonatomic, readonly) double hourlyRate;
@property (nonatomic, readonly) double hoursWorked;
@property (nonatomic, readonly) double totalAmountDue;

- (instancetype)initWithClient:(NSString *)aClient
                   workSummary:(NSString *)aWorkSummary
                    hourlyRate:(double)anHourlyRate
                   hoursWorked:(double)theHoursWorked;

@end

NS_ASSUME_NONNULL_END
