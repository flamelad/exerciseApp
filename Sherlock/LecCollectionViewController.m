//
//  LecCollectionViewController.m
//  Sherlock
//
//  Created by Yi-Shou on 2014/8/31.
//  Copyright (c) 2014年 Yi-Shou. All rights reserved.
//

#import "LecCollectionViewController.h"

@interface LecCollectionViewController ()

@end

@implementation LecCollectionViewController

NSArray *array1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   array1=@[@"L7",@"L10",@"L11-3",@"L15",@"L16",@"L17",@"DP"];
    self.collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:1.0f];
    
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
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [array1 count];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(60, 40);
    return size;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 50, 20, 50);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"reuseCollectionCell" forIndexPath:indexPath];
    if (cell) {
        UILabel *label=(UILabel *)[cell viewWithTag:100];
        label.text=array1[indexPath.row];
        [label setTextAlignment:NSTextAlignmentCenter];
//        UIImage *deselectedImg=[UIImage imageNamed:@"testPic.png"];
//        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 60, 40)];
//        label.text=array1[[indexPath row]];
//        UIImageView *deselectedImgView=[[UIImageView alloc]initWithImage:deselectedImg];
//        [cell.contentView addSubview:label];
//        [cell setBackgroundColor:[[UIColor alloc] initWithCGColor:]];
    }
    else NSLog(@"Cell has problem");
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"the cell %ld is selected",[indexPath row]);
    NSMutableString *segueStr=[[NSMutableString alloc]initWithString:@"function_"];
    [segueStr appendFormat:@"%ld",[indexPath row]];
    [self performSegueWithIdentifier:segueStr sender:self];
    }

@end
