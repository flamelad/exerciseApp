//
//  Lec17ViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/13.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "Lec17ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface Lec17ViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property UIImageView *imageView;
@property UIImage *image;
@property (strong, nonatomic)UIImagePickerController *imagePicker;
@end

@implementation Lec17ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)takePic:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.delegate = self;
    self.imagePicker.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.imagePicker.allowsEditing = YES;
    NSLog(@"%@",self.navigationController);

    [self presentViewController:self.imagePicker animated:YES completion:^{
        NSLog(@"display imagePicker");
    }];


}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    navigationController.navigationBarHidden=NO;
}

- (void)showNavigationBar:(UIImagePickerController*)imagePicker {
    [imagePicker setNavigationBarHidden:NO];
}
- (void) image:(UIImage *)image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo{
    NSLog(@"what");
    if (error) {
        NSLog(@"wrong");
    }
    else
        NSLog(@"okokokokok");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //一般情況下沒有什麼特別要做的事情
    NSLog(@"ttttttt");
//       self.image=[UIImage imageNamed:@"testPic.png"];
//    UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
NSLog(@"GGGGGGGGGGGGGGGGGGGGGGGGGGG:%hhd",self.imagePicker.isNavigationBarHidden);

    self.image=[info objectForKey:UIImagePickerControllerEditedImage];
    self.imageView=[[UIImageView alloc]initWithImage:self.image];
    self.imageView.center=self.view.center;
    [self.view addSubview:self.imageView];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(NSString *) getTime{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *parseNumber=[formatter numberFromString:@"123456"];
    NSLog(@"%@",parseNumber);
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    NSDateComponents *dc=[calendar components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:date];
    NSLog(@"The time is %d:%d:%d", [dc hour], [dc minute], [dc second]);
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    NSString *dateFormat=[NSDateFormatter dateFormatFromTemplate:@"yMMMMd"
                                                         options:0
                                                          locale:usLocale];
    NSDateFormatter *formatDate=[[NSDateFormatter alloc]init];
    [formatDate setDateFormat:dateFormat];
    NSLog(@"%@, and %@", [usLocale displayNameForKey:NSLocaleIdentifier value:[usLocale localeIdentifier]], dateFormat);
    return [formatDate stringFromDate:date];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%hhd",[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]);
//    NSLog(@"%hhd",[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]);
//    NSLog(@"%hhd",[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]);

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
