//
//  ssTableViewCell.m
//  iOS 动态加载不同高度cell缓存
//
//  Created by 张文勇 on 2017/6/26.
//  Copyright © 2017年 张文勇. All rights reserved.
//

#import "ssTableViewCell.h"

@interface ssTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *mylable;
/**
 注释
 */
@property (nonatomic,strong)NSString *ssss;

@end
@implementation ssTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setsting:(NSString *)str
{
    _mylable.text = str;
    _ssss =str;
}


-(CGFloat)getgedd
{
    
    CGSize size = [_ssss boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17 ]} context:nil].size;
    
  
    
 
    
    return size.height;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
