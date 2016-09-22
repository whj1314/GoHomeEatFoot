//
//  TRRecommendCell.m
//  DaDaCook
//
//  Created by tarena on 16/8/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRRecommendCell.h"

@implementation TRRecommendCell

- (IBAction)addBtnClicked:(id)sender {
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
