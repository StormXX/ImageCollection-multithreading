//
//  myCell.m
//  demo_imagecollection
//
//  Created by DangGu on 14-9-25.
//  Copyright (c) 2014年 DangGu. All rights reserved.
//

#import "myCell.h"

@implementation myCell
@synthesize image;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize cellsize=self.frame.size;
        image=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cellsize.width,cellsize.height)];
        [self addSubview:image];
    }
    return self;
}
@end
