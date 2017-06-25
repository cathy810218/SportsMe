//
//  CategoryCell.m
//  SportsMe
//
//  Created by Cathy Oun on 6/24/17.
//  Copyright © 2017 Cathy Oun. All rights reserved.
//

#import "CategoryCell.h"
#import <Masonry/Masonry.h>

@interface CategoryCell()
@property (strong, nonatomic) UIView *dimView;
@end
@implementation CategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.layer.masksToBounds = YES;
    
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.transform = CGAffineTransformMakeScale(0.96, 0.96);
    } else {
        self.transform = CGAffineTransformIdentity;
    }
}


@end
