//
//  ImagesTwo.h
//  demo_imagecollection
//
//  Created by DangGu on 14-9-26.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myCell.h"

@interface ImagesTwo : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * cv;

@end
