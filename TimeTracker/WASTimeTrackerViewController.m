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


@end

@implementation WASTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
