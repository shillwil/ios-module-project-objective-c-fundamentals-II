//
//  WASTimedTaskController.h
//  TimeTracker
//
//  Created by Alex Shillingford on 5/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WASTimedTask.h"

NS_ASSUME_NONNULL_BEGIN

@class WASTimedTask;

@interface WASTimedTaskController : NSObject

// MARK: - Properties
@property (nonatomic) NSMutableArray *tasksArray;

- (void)createTimedTaskWithClient:(NSString *)aClient
                      workSummary:(NSString *)aWorkSummary
                       hourlyRate:(double)anHourlyRate
                      hoursWorked:(double)theHoursWorked;

@end

NS_ASSUME_NONNULL_END
