//
//  ScrollViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/7/22.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property UIImageView *imgview;
@end

@implementation ScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)testButton:(id)sender {
    [_scrollView setZoomScale:2.5 animated:YES];
    CGRect rect=CGRectMake(400, 400, 10, 10);
    [_scrollView zoomToRect:rect animated:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    UIImage *img=[UIImage imageNamed:@"testPic.png"];
    _imgview=[[UIImageView alloc]initWithImage:img];
    [_imgview setTag:100];
    
    _scrollView.contentSize=_imgview.frame.size;
        [_scrollView setDelegate:self];
    [_scrollView addSubview:_imgview];

    [_scrollView setMaximumZoomScale:2.0];
    [_scrollView setMinimumZoomScale:0.1];

    
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

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    NSLog(@"%@\n",_imgview);
//    NSLog(@"%@\n",[_imgview superview]);
//    NSLog(@"%@\n",scrollView);
    return [scrollView viewWithTag:100];
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
//    [scrollView setZoomScale:1.0 animated:YES];
    NSLog(@"gg");
    
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
