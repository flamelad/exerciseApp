//
//  DPViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/25.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "DPViewController.h"
#import "superTest.h"
#import "SubTest.h"

@protocol superTest1
-(void)print;
@end

@interface SubTest1 : NSObject <superTest1>
-(void)print;
@end

@interface DPViewController ()

@end

@implementation DPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    superTest *testInstance=[[SubTest alloc]init];
//    [testInstance printSomething];
//    id <superTest1> gg;
//    gg=[[SubTest1 alloc] init];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
