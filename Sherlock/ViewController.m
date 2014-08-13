//
//  ViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/7/13.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "ViewController.h"
#import "Lec16ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testbbbb;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property UIView *testView1,*testView2;
@property (strong)UIButton *testbaba;
@property (strong, nonatomic)UIDynamicAnimator *animator;
@property UIAttachmentBehavior *attachment;
@property UIGravityBehavior *gravity;
@property UICollisionBehavior *collision;
-(IBAction)testGesture:(UIGestureRecognizer *)sender;

@end

@implementation ViewController
- (IBAction)testbbbb:(id)sender {
    NSLog(@"%d",[sender isHighlighted]);
     }

- (IBAction)actButton:(id)sender {

//    [UIView transitionFromView:_testView2
//                        toView:_testView1
//                      duration:3
//                       options:UIViewAnimationOptionShowHideTransitionViews
//                    completion:nil];

//    [UIView transitionWithView:_testView2
//                      duration:3
//                       options:UIViewAnimationOptionTransitionCurlDown
//                    animati/Users/flamelad/Desktop/iOSApp/ENLI/foreign_exchange/foreign_exchange.xcodeprojons:^{[_testView2 addSubview:_testView1];}
//                    completion:nil];

    

    
}
-(void)testbb:(UIButton *)sender{
    NSLog(@"ojojoj");
    NSLog(@"%d",[sender isSelected]);
    NSLog(@"%d",[sender isTracking]);
    NSLog(@"%d",[sender isHighlighted]);
    if (_testbaba.isTracking) {
        NSLog(@"tracking");
    }
    else
        NSLog(@"no tracking");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",self.navigationItem);
    _testbaba=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_testbaba addTarget:self action:@selector(testbb:) forControlEvents:UIControlEventTouchDown];
    [_testbaba addTarget:self action:@selector(testbb:) forControlEvents:UIControlEventTouchUpInside];
    [_testbaba addTarget:self action:@selector(testbb:) forControlEvents:UIControlEventTouchDragOutside];
    [_testbaba setBackgroundColor:[UIColor blueColor]];
    [_testbaba setTitle:@"ttttt" forState:UIControlStateNormal];
    [_testbaba setBackgroundColor:[UIColor blueColor]];
    [_testbaba setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_testbaba];

    
}
-(void)viewWillAppear:(BOOL)animated{
    
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"NewTitle"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    //    [[self navigationItem] setBackBarButtonItem:newBackButton];
    //    [[[self navigationItem] backBarButtonItem] setTitle:@"asdfasfd"];
    //    NSLog(@"%@",self.navigationItem.backBarButtonItem);
    [self.navigationItem setBackBarButtonItem:newBackButton];
//    [UIView animateWithDuration:3
//                          delay:0
//                        options:UIViewAnimationOptionTransitionCurlDown
//                     animations:^{_testView2.alpha=0;}
//                     completion:nil];

 
}

- (IBAction)back:(UIStoryboardSegue *)segue {
    NSLog(@"ohoh");
    Lec16ViewController *sourceVc=(Lec16ViewController *)segue.sourceViewController;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"modalViewId"]) {
        Lec16ViewController *destVc=segue.destinationViewController;
        
    }
}

- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _testView1=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    _testView2=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    _testView1.backgroundColor=[UIColor yellowColor];
    _testView2.backgroundColor=[UIColor blueColor];
    _logoView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:_testView1];
    _testView1.transform=CGAffineTransformRotate(_testView1.transform, 45);
    //    [self.view addSubview:_testView2];

    _animator=[[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity=[[UIGravityBehavior alloc]initWithItems:@[_testView1]];
    _collision=[[UICollisionBehavior alloc]initWithItems:@[_testView1]];
    _collision.translatesReferenceBoundsIntoBoundary=YES;
    
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    
//    collision.collisionDelegate=self;
    
}

- (IBAction)testGesture:(UIPanGestureRecognizer *)sender {

//        if (sender.state == UIGestureRecognizerStateBegan) {
//            NSLog(@"test1");
//            CGPoint squareCenterPoint=CGPointMake(_testView1.center.x, _testView1.center.y);
////            CGPoint attachmentPoint=CGPointMake(-25, -25);
//            UIOffset offset=UIOffsetMake(-25, -25);
////            _attachment=[[UIAttachmentBehavior alloc] initWithItem:_testView1 attachedToAnchor:squareCenterPoint];
//            _attachment=[[UIAttachmentBehavior alloc]initWithItem:_testView1 offsetFromCenter:offset attachedToAnchor:squareCenterPoint];
//            
//            [_animator addBehavior:_attachment];
//        }
//        else if(sender.state== UIGestureRecognizerStateChanged){
//            NSLog(@"test2");
//            [_attachment setAnchorPoint:[sender locationInView:self.view]];
////            [_animator removeBehavior:_gravity];
//        }
//        else if(sender.state== UIGestureRecognizerStateEnded){
//                        NSLog(@"test3");
//            [_animator removeBehavior:_attachment];
////            [_animator addBehavior:_gravity];
//            
//        }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
