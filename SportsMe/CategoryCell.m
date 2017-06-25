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


- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected) {
        NSLog(@"Select!");
    } else {
        NSLog(@"Deselect");
    }
}



@end
