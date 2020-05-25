//
//  WASTimeTrackerViewController.m
//  TimeTracker
//
//  Created by Alex Shillingford on 5/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "WASTimeTrackerViewController.h"

@interface WASTimeTrackerViewController ()

@property (weak, nonatomic) IBOutlet UITextField *clientNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *workSummaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *hourlyRateTextField;
@property (weak, nonatomic) IBOutlet UITextField *hoursWorkedTextField;
@property (weak, nonatomic) IBOutlet UITableView *tasksTableView;

@property (nonatomic) WASTimedTaskController *taskController;

@end

@implementation WASTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _taskController = [[WASTimedTaskController alloc] init];
    self.tasksTableView.dataSource = self;
}

- (IBAction)logTime:(id)sender
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    WASTimedTask *task = [self.taskController.tasksArray objectAtIndex:indexPath.row];
    NSNumber *total = [[NSNumber alloc] initWithDouble:task.totalAmountDue];
    cell.textLabel.text = task.client;
    cell.detailTextLabel.text = [formatter stringFromNumber:total];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskController.tasksArray.count;
}


@end
