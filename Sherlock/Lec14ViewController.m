//
//  Lec14ViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/4.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "Lec14ViewController.h"
#import "MapPin.h"

@interface Lec14ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView1;
@property MKCoordinateRegion kaos_digital;

@end

@implementation Lec14ViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)onOrOff3D:(id)sender {
    UISwitch *switch3D=(UISwitch *)sender;
    if([switch3D isOn]){
        self.mapView1.pitchEnabled=YES;
        self.mapView1.showsBuildings = YES;

        
//        MKMapCamera *userCam=[MKMapCamera cameraLookingAtCenterCoordinate:CLLocationCoordinate2DMake(25.01141, 121.42554)
//                                                         fromEyeCoordinate:CLLocationCoordinate2DMake(25.01141, 121.42554) eyeAltitude:200];
//        userCam.centerCoordinate = _kaos_digital.center;
//        userCam.heading=0;
//        userCam.pitch=0;
//        userCam.altitude=0.5;
//        [self.mapView setCamera:userCam animated:YES];
//        self.mapView.camera=userCam;
    }
    else
    self.mapView1.pitchEnabled=NO;
    self.mapView1.showsBuildings = NO;

}
- (IBAction)mapTypeChange:(id)sender {
    UISegmentedControl *segCtlr=(UISegmentedControl *)sender;
    if (segCtlr.selectedSegmentIndex==0) {
        self.mapView1.mapType =MKMapTypeStandard;}
    else if(segCtlr.selectedSegmentIndex==1){
    self.mapView1.mapType = MKMapTypeSatellite;
    }
    else
    self.mapView1.mapType = MKMapTypeHybrid;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView1.showsUserLocation=YES;
    self.mapView1.showsPointsOfInterest=YES;
    self.mapView1.delegate=self;
    // Do any additional setup after loading the view.
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
- (MKAnnotationView *)mapView:(MKMapView *)sender
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *aView = [sender dequeueReusableAnnotationViewWithIdentifier:@"annview"];
    if (!aView) {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                reuseIdentifier:@"annview"];
        }
    aView.canShowCallout=YES;
    aView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    NSLog(@"%@",aView.annotation.title);
        aView.annotation = annotation;
        return aView;
    }
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolylineRenderer *polylineRender = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    polylineRender.lineWidth = 3.0f;
    polylineRender.strokeColor = [UIColor blueColor];

    return polylineRender;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.mapView1.userTrackingMode=MKUserTrackingModeFollow;
    // 設定經緯度
    _kaos_digital.center.latitude = 25.01141;
    _kaos_digital.center.longitude = 121.42554;
    
    // 設定縮放比例
    _kaos_digital.span.latitudeDelta = 0.007;
    _kaos_digital.span.longitudeDelta = 0.007;
    NSMutableArray *ann=[[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0; i<10; i++) {
        MapPin *ann1=[[MapPin alloc] initWithPinCoordinate:_kaos_digital.center];
        ann1.title=[@"test" stringByAppendingFormat:@"%d",i];
        ann1.subtitle=[@"test" stringByAppendingFormat:@"%d",i];
        ann[i]=ann1;
        _kaos_digital.center.latitude+=0.001;
    }
    [self.mapView1 setRegion:_kaos_digital animated:YES];
//    [self.mapView1 addAnnotation:ann[9]];
    NSLog(@"%hhd",self.mapView1.isUserLocationVisible);
    NSLog(@"%@",self.mapView1.userLocation.title);

    //map location search 實作
    
#pragma map directions, overlay

    MKDirectionsRequest *directRequest=[[MKDirectionsRequest alloc]init];
    MKPlacemark *markSource=[[MKPlacemark alloc]initWithCoordinate:_kaos_digital.center addressDictionary:nil];
    MapPin *sourceAnn=[[MapPin alloc] initWithPinCoordinate:_kaos_digital.center];
    sourceAnn.title=@"source";
    _kaos_digital.center.longitude+=0.005;
    MKPlacemark *markDestination=[[MKPlacemark alloc]initWithCoordinate:_kaos_digital.center addressDictionary:nil];
    MapPin *destAnn=[[MapPin alloc] initWithPinCoordinate:_kaos_digital.center];
    destAnn.title=@"dest";
    [self.mapView1 addAnnotation:sourceAnn];
    [self.mapView1 addAnnotation:destAnn];
    MKMapItem *mapSource=[[MKMapItem alloc]initWithPlacemark:markSource];
    MKMapItem *mapDestination=[[MKMapItem alloc]initWithPlacemark:markDestination];
    directRequest.source=mapSource;
    directRequest.destination=mapDestination;
    directRequest.requestsAlternateRoutes = YES;
    MKDirections *direction=[[MKDirections alloc]initWithRequest:directRequest];
    [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
        else{
            MKRoute *route=response.routes[0];
            for(MKRouteStep *step in route.steps){
                NSLog(@"instructions:%@",step.instructions);
            }
            [self.mapView1 addOverlay:route.polyline];
        }
    }];

#pragma map location search
    MKLocalSearchRequest *localSearchRequest = [[MKLocalSearchRequest alloc] init];
    localSearchRequest.region = _kaos_digital;
    localSearchRequest.naturalLanguageQuery = @"hotel";
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:localSearchRequest];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSLog(@"the response's count is:%d",response.mapItems.count);        //经我测试，这里每次最多只有10条记录
        if (error) {
            NSLog(@"error info is：%@",error);
        }else{
            for (MKMapItem *mapItem in response.mapItems) {
//                MKPointAnnotation * annotation = [[MKPointAnnotation alloc] init];
                MapPin *annTmp=[[MapPin alloc] initWithPinCoordinate:mapItem.placemark.coordinate];
                
                annTmp.title = mapItem.placemark.title;

                [self.mapView1 addAnnotation:annTmp];
            }
        }
    }];
}
@end
