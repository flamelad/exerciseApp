//
//  TableViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/7/22.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "TableViewController.h"
#import "Photo.h"
#import "malloc/malloc.h"
#include <objc/runtime.h>

@interface TableViewController ()
@property NSArray *testArray;
@property UIManagedDocument *document;
@property Photo *testStrong;
@property NSFetchedResultsController *coreDataResult;
@property int i;
@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)contextChanged:(NSNotification *) Notification{
//    NSLog(@"%@",Notification.userInfo);
    NSSet *insertObjects = [Notification.userInfo objectForKey:NSInsertedObjectsKey];
//    NSLog(@"%d",[insertObjects count]);
    for(NSManagedObject *insertObject in insertObjects){
//    NSLog(@"\n%@", insertObject);
    }

    
}

//        NSString *teststr=[NSString alloc];
//        NSValue *num=[NSValue alloc];
//       NSDictionary *testdic=[NSDictionary alloc];
//        NSArray *gg=@[@"1"];
//        NSLog(@"gg class:%@, array class:%@",[gg class],[NSArray class]);
//        NSLog(@"array malloc_size:%zd",malloc_size((__bridge const void *)(gg)));
//        NSLog(@"array class_getInstanceSize:%zd",class_getInstanceSize(([gg class])));
//        NSLog(@"String malloc_size:%zd",malloc_size((__bridge const void *)(teststr)));
//        NSLog(@"String class_getInstanceSize:%zd",class_getInstanceSize(([teststr class])));
//        NSLog(@"number malloc_size:%zd",malloc_size((__bridge const void *)(num)));
//        NSLog(@"number class_getInstanceSize:%zd",class_getInstanceSize(([gg class])));
//        NSLog(@"Dic malloc_size:%zd",malloc_size((__bridge const void *)(testdic)));
//        NSLog(@"Dic class_getInstanceSize:%zd",class_getInstanceSize(([testdic class])));


-(void)readyToWrite{
    if([_document documentState]==UIDocumentStateNormal){
//            self.i++;
//        NSManagedObjectContext *context=[_document managedObjectContext];
//        self.testStrong=[NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
//        //        [self.document.managedObjectContext deleteObject:_testStrong];
//        self.testStrong.photoURL=@"ohoh";
//        self.testStrong.title=[NSString stringWithFormat:@"well%d",self.i % 10];
//        self.testStrong.subtitle=[NSString stringWithFormat:@"%d",self.i];
//        self.testStrong.thumbnailData=[@"123" dataUsingEncoding:NSUTF8StringEncoding];
//        self.testStrong.thumbnailURL=@"holy.shit";
//        self.testStrong.uploadDate=[[NSDate alloc]initWithTimeIntervalSinceNow:8*60*60];
//        [self.document saveToURL:self.document.fileURL
//                forSaveOperation:UIDocumentSaveForOverwriting
//               completionHandler:^(BOOL success) {
//                   NSLog(@"ok");
//                   if (self.i<100) {
//                   [self readyToWrite];
//                   }
//                   
//               }];
//            NSLog(@"%@",self.testStrong);
//        }

        NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Photo"];
        request.fetchBatchSize=20;
        request.fetchLimit=100;
        request.sortDescriptors=@[[NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                ascending:NO
                                                                selector:@selector(localizedStandardCompare:)
                                                                ]];
        NSManagedObjectContext *coredata=self.document.managedObjectContext;
        NSError *error;
        NSArray *photos=[coredata executeFetchRequest:request error:&error];
        NSLog(@"%@",[photos class]);
        NSLog(@"%zd",malloc_size((__bridge const void *)(photos)));
        for(Photo *photo in photos){
            NSLog(@"%@",photo.title);
//        NSLog(@"%zd",malloc_size((__bridge const void *)(photos)));
//        NSLog(@"%@",photo);
        }
        NSLog(@"%zd",malloc_size((__bridge const void *)(photos)));
        NSLog(@"%@",photos[0]);
//NSLog(@"%zd",sizeof(photos));

//        _coreDataResult = [[NSFetchedResultsController alloc]initWithFetchRequest:request
//                                                                 managedObjectContext:self.document.managedObjectContext
//                                                                   sectionNameKeyPath:@"subtitle"
//                                                                            cacheName:nil];
//        [_coreDataResult performFetch:&error];
//        NSLog(@"%d",[[_coreDataResult sections] count]);
//        [self.tableView reloadData];
    }
}

- (IBAction)ttbutton:(id)sender {
//    NSDateFormatter *timeFormat=[[NSDateFormatter alloc]init];
//    [timeFormat setDateFormat:@"YYYY-MM-d HH:mm:ss"];
//    [timeFormat setTimeZone:[[NSTimeZone alloc]initWithName:@"Asia/Taipei"]];
//    NSString *str=[timeFormat stringFromDate:[NSDate date]];
//    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Photo"];
//    request.fetchBatchSize=5;
//    request.fetchLimit=100;
//    request.sortDescriptors=@[[NSSortDescriptor sortDescriptorWithKey:@"title"
//                                                          ascending:YES
//                                                           selector:@selector(localizedStandardCompare:)]];
//    NSManagedObjectContext *SQLiteDB=self.document.managedObjectContext;
//    NSError *error;
//    NSArray *photos=[SQLiteDB executeFetchRequest:request error:&error];
//    for(Photo *photo in photos){
//        NSLog(@"%@",photo.title);
//    }


}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _i=0;
    _testArray=@[@"test",@"test2",@"test3"];

    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSURL *docDirectory=[[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSString *docName=@"myDocument";
    NSURL *url=[docDirectory URLByAppendingPathComponent:docName];
//    NSLog(@"%@\n",docDirectory);
//    NSError *error;
//    [fileManager removeItemAtURL:url error:&error];
    _document=[[UIManagedDocument alloc]initWithFileURL:url];
    if([fileManager fileExistsAtPath:[url path]]){
        [_document openWithCompletionHandler:^(BOOL success){
            if (success)[self readyToWrite];
            else NSLog(@"fail to open");
        }];
    }else{
        [_document saveToURL:url
            forSaveOperation:UIDocumentSaveForCreating
           completionHandler:^(BOOL success){
            if(success)[self readyToWrite];
            else NSLog(@"fail to Create file");
            ;}];
    }
    SEL test1;
    test1=@selector(contextChanged:);
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:test1
                   name:NSManagedObjectContextDidSaveNotification
                 object:self.document.managedObjectContext];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)refresh:(id)sender {
    [self.refreshControl beginRefreshing];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
//        while (true) {
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
        });
    });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
//    NSLog(@"%d",[[self.coreDataResult sections] count]);
    return [[self.coreDataResult sections] count];
//    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%d",[[[self.coreDataResult sections]objectAtIndex:section] numberOfObjects]);
    return [[[self.coreDataResult sections]objectAtIndex:section] numberOfObjects];
//    return [_testArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
//    }
    Photo *data=[self.coreDataResult objectAtIndexPath:indexPath];
    cell.textLabel.text=data.subtitle;
//    cell.textLabel.text=[_testArray objectAtIndex:[indexPath row]];
    // Configure the cell...
    
    return cell;
}

@end
