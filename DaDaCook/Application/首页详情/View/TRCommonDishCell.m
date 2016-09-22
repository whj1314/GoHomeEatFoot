//
//  TRCommonDishCell.m
//  DaDaCook
//
//  Created by tarena on 16/8/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRCommonDishCell.h"

@implementation TRCommonDishCell

- (IBAction)addBtnClicked:(UIButton *)sender {
    !_addHandler ?: _addHandler(sender);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
