//
//  Lec16ViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/12.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "Lec16ViewController.h"
#import "ViewController.h"
@interface Lec16ViewController () <UITextFieldDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mytextField;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBOutlet UIView *view;
@property UIActionSheet *actionSheet;

@end

@implementation Lec16ViewController
- (IBAction)test:(id)sender {
    [self.mytextField resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)whenTextChanged:(NSNotification *)notification{
    NSLog(@"sadf");
    self.myLabel.text=self.mytextField.text;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"ggggg");
    [textField resignFirstResponder];
    return NO;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"SSSS");
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.mytextField isExclusiveTouch]) {
        [self.mytextField resignFirstResponder];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //textfield and keyboard
    self.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    self.mytextField.delegate=self;
    self.mytextField.rightViewMode=UITextFieldViewModeAlways;
    self.mytextField.leftView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    self.mytextField.rightView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    self.mytextField.inputAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    self.mytextField.leftViewMode=UITextFieldViewModeAlways;
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(whenTextChanged:)
                   name:UITextFieldTextDidChangeNotification
                 object:self.mytextField];
    //above textfiled and keyboard
    //action sheet
//    self.modalPresentationStyle=UIModalPresentationPageSheet;
    // Do any additional setup after loading the view.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.actionSheet=[[UIActionSheet alloc]initWithTitle:@"Lec16"
                                                delegate:self
                                       cancelButtonTitle:@"cancel"
                                  destructiveButtonTitle:@"destructive"
                                       otherButtonTitles:@"1",@"2", nil];
    [self.actionSheet showInView:self.view];
    [self.actionSheet addButtonWithTitle:@"more"];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex:@%d",buttonIndex);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
