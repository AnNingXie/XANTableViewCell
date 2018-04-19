//
//  XANHomeTableViewCell.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "XANHomeTableViewCell.h"
#import "XANHomeStatus.h"
#import "XANHomeFrame.h"
#import "UIImageView+WebCache.h"
@interface XANHomeTableViewCell ()
@property (nonatomic, weak) UIImageView *icon;//头像
@property (nonatomic, weak) UILabel *name;//昵称
@property (nonatomic, weak) UILabel *content;//正文
@end

@implementation XANHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"XANHomeTableViewCell";
    XANHomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XANHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加所有子控件
        [self setUpViews];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setHomeFrame:(XANHomeFrame *)homeFrame{
    _homeFrame=homeFrame;
    
    //给子控件赋值
    [self setUpData];
    
    //设置子控件frame
    [self setUpFrame];
}

/**
 给子控件赋值
 */
-(void)setUpData{
    //获取数据模型
    XANHomeStatus *status=self.homeFrame.status;
    
    //头像
    SDWebImageOptions options=SDWebImageRetryFailed | SDWebImageLowPriority;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:status.icon] placeholderImage:[UIImage imageNamed:@"iconPlace"] options:options];
    
    self.name.text=status.name;
    
    //设置行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:status.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, status.content.length)];
    _content.attributedText = attributedString;
    //正文
    self.content.text=status.content;
    
}

/**
 设置子控件frame
 */
-(void)setUpFrame{
    //头像
    self.icon.frame=self.homeFrame.iconFrame;
    //名字
    self.name.frame=self.homeFrame.nameFrame;
    //内容
    self.content.frame=self.homeFrame.contentFrame;
}

/**
 添加所有子控件
 */
-(void)setUpViews{
    //头像
    UIImageView *icon=[[UIImageView alloc]init];
    [self.contentView addSubview:icon];
    _icon=icon;
    
    //昵称
    UILabel *name=[[UILabel alloc]init];
    name.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:name];
    _name=name;
    
    //正文
    UILabel *content=[[UILabel alloc]init];
    content.font=[UIFont systemFontOfSize:14];
    content.numberOfLines=0;
    content.textColor=[UIColor blackColor];
    [self.contentView addSubview:content];
    _content=content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
