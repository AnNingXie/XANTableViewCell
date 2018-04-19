//
//  XANHomeFrame.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "XANHomeFrame.h"
#import "XANPCH.h"
#import "XANHomeStatus.h"
@implementation XANHomeFrame

-(void)setStatus:(XANHomeStatus *)status{
    _status=status;
    
    //设置所有控件Frame
    [self setUpFrames];
}

/**
 设置所有控件Frame
 */
-(void)setUpFrames{
    CGFloat margin=10;
    //头像
    CGFloat iconX=margin;
    CGFloat iconY=margin;
    CGFloat iconWH=50;
    self.iconFrame=CGRectMake(iconX, iconY, iconWH, iconWH);
    
    //昵称
    CGFloat nameX=CGRectGetMaxX(self.iconFrame)+margin;
    CGFloat nameY=margin;
    self.nameFrame=CGRectMake(nameX, nameY, 50, 30);
    
    //正文
    CGFloat contentX=iconX;
    CGFloat contentY=CGRectGetMaxY(self.iconFrame)+margin;
    
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    //计算文字高度
    CGSize size=CGSizeMake(KScreenWidth-margin*2, CGFLOAT_MAX);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSParagraphStyleAttributeName:paragraphStyle};
    CGSize contentSize=[_status.content boundingRectWithSize:size options:options attributes:attributes context:nil].size;
    CGFloat contentW=KScreenWidth-margin*2;
    CGFloat contentH=contentSize.height;
    self.contentFrame=CGRectMake(contentX, contentY, contentW, contentH);
    //行高
    self.cellHeight=CGRectGetMaxY(self.contentFrame)+margin;
}

@end
