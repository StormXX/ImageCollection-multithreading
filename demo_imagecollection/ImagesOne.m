//
//  ImagesOne.m
//  demo_imagecollection
//
//  Created by DangGu on 14-9-25.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import "ImagesOne.h"
@interface ImagesOne (){
    int picNum;
}

@end

@implementation ImagesOne
@synthesize cv=_cv;
@synthesize queue;
- (void)viewDidLoad {
    [super viewDidLoad];
    picNum=9;
    //初始化布局管理
    UICollectionViewFlowLayout * flowlayout=[[UICollectionViewFlowLayout alloc] init];
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowlayout setMinimumInteritemSpacing:0];
    [flowlayout setMinimumLineSpacing:20];
    
    CGRect bound=self.view.bounds;
    _cv=[[UICollectionView alloc] initWithFrame:bound collectionViewLayout:flowlayout];
    [_cv setBackgroundColor:[UIColor clearColor]];
    [_cv registerClass:[myCell class] forCellWithReuseIdentifier:@"cell"];
    _cv.delegate=self;
    _cv.dataSource=self;
    [self.view addSubview:_cv];
    queue=[[NSOperationQueue alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (int)picNum;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    myCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    //[cell sizeToFit];
    cell.backgroundColor=[UIColor redColor];
    UIImage *mypic=[UIImage imageNamed:@"placeholder.jpg"];
    cell.image.image=mypic;
    cell.image.tag=100+indexPath.row;
    NSInvocationOperation * operation=[[NSInvocationOperation alloc] initWithTarget:self
                                                                     selector:@selector(getImage:)
                                                                     object:[NSNumber numberWithInteger:indexPath.row]];
    [queue addOperation:operation];
    
    return cell;
}

//cell的布局
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {2,2,2,2};
    return top;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(103,183);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}

-(void)getImage:(NSNumber *)tagnum
{
    NSString * urlStr=[NSString stringWithFormat:@"http://stormxx-app-image.qiniudn.com/%d.pic.jpg",[tagnum intValue]+1];
    NSURL * url=[NSURL URLWithString:urlStr];
    NSData * data=[NSData dataWithContentsOfURL:url];
    UIImage * image=[UIImage imageWithData:data];
    NSMutableDictionary * dic=[[NSMutableDictionary alloc] init];
    [dic setObject:tagnum forKey:@"tagnum"];
    [dic setObject:image forKey:@"image"];
    [self performSelectorOnMainThread:@selector(UpdateUI:) withObject:dic waitUntilDone:YES];
}
-(void)UpdateUI:(NSDictionary *)argDic
{
    UIImageView * tempimage=[self.view viewWithTag:100+[[argDic objectForKey:@"tagnum"] intValue]];
    tempimage.image=(UIImage*)[argDic objectForKey:@"image"];
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
