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
//    self.imagePicker.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.imagePicker.allowsEditing = YES;
    [self presentViewController:self.imagePicker animated:YES completion:^{
        NSLog(@"display imagePicker");
    }];
    

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
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    self.image=[info objectForKey:UIImagePickerControllerEditedImage];
    self.imageView=[[UIImageView alloc]initWithImage:self.image];
    self.imageView.center=self.view.center;
    [self.view addSubview:self.imageView];
    [self dismissViewControllerAnimated:YES completion:^{}];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"%hhd",[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]);
//    NSLog(@"%hhd",[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]);
//    NSLog(@"%hhd",[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]);
    CMMotionManager *motionManager=[[CMMotionManager alloc]init];
    NSLog(@"%d",[motionManager isAccelerometerAvailable]);
    NSLog(@"%d",[motionManager isDeviceMotionAvailable]);
    NSLog(@"%d",[motionManager isGyroAvailable]);
    NSLog(@"%d",[motionManager isMagnetometerAvailable]);
    NSBundle *b1;
    NSString *key,*table,*defaultValue,*comment;
    NSBundle *bundle=NSLocalizedStringWithDefaultValue(key, table, b1, defaultValue, comment);
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
