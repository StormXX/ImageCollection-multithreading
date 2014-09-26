//
//  ImagesOne.h
//  demo_imagecollection
//
//  Created by DangGu on 14-9-25.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCell.h"
@interface ImagesOne : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * cv;
@property (nonatomic,strong) NSOperationQueue * queue;
@end
