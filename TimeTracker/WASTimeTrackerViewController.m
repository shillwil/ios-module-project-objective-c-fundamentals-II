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
@property (weak, nonatomic) IBOutlet UIButton *logTimeButton;

@property (nonatomic) WASTimedTaskController *taskController;
@property (nonatomic) NSInteger taskIndex;

@end

@implementation WASTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _taskController = [[WASTimedTaskController alloc] init];
    self.tasksTableView.dataSource = self;
    self.tasksTableView.delegate = self;
}

- (IBAction)logTime:(id)sender
{
    if([_logTimeButton.titleLabel.text  isEqual: @"Update"]) {
        NSString *clientName = _clientNameTextField.text;
        NSString *workSummaryText = _workSummaryTextField.text;
        double rate = [_hourlyRateTextField.text doubleValue];
        double hours = [_hoursWorkedTextField.text doubleValue];
        
        [_taskController updateTimedTaskWithClient:clientName workSummary:workSummaryText hourlyRate:rate hoursWorked:hours index:_taskIndex];
    } else {
        NSString *clientName = _clientNameTextField.text;
        NSString *workSummaryText = _workSummaryTextField.text;
        double rate = [_hourlyRateTextField.text doubleValue];
        double hours = [_hoursWorkedTextField.text doubleValue];
        
        [_taskController createTimedTaskWithClient:clientName workSummary:workSummaryText hourlyRate:rate hoursWorked:hours];
    }
    
    [_tasksTableView reloadData];
    
    _clientNameTextField.text = @"";
    _workSummaryTextField.text = @"";
    _hourlyRateTextField.text = @"";
    _hoursWorkedTextField.text = @"";
}

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

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WASTimedTask *task = [self.taskController.tasksArray objectAtIndex:indexPath.row];
    NSNumber *totalHours = [NSNumber numberWithDouble:task.hoursWorked];
    NSNumber *rate = [NSNumber numberWithDouble:task.hourlyRate];
    
    _clientNameTextField.text = task.client;
    _workSummaryTextField.text = task.workSummary;
    _hoursWorkedTextField.text = [totalHours stringValue];
    _hourlyRateTextField.text = [rate stringValue];
    _logTimeButton.titleLabel.text = @"Update";
    _taskIndex = indexPath.row;
}

@end
