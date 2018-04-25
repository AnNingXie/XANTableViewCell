//
//  XANMeTableViewCell.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/25.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "XANMeTableViewCell.h"
#import "XANPCH.h"
#import "XANMeStatus.h"
#import "UIImageView+WebCache.h"
@interface XANMeTableViewCell ()
@property (nonatomic, weak) UIImageView *icon;//头像
@property (nonatomic, weak) UILabel *name;//昵称

@end

@implementation XANMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"XANMeTableViewCell";
    XANMeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[XANMeTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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

-(void)setStatus:(XANMeStatus *)status{
    _status=status;
    _name.text=status.name;
    //头像
    SDWebImageOptions options=SDWebImageRetryFailed | SDWebImageLowPriority;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:status.icon] placeholderImage:[UIImage imageNamed:@"iconPlace"] options:options];

}

/**
 添加所有子控件
 */
-(void)setUpViews{
    //头像
    UIImageView *icon=[[UIImageView alloc]init];
    [self.contentView addSubview:icon];
    _icon=icon;
    [icon autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [icon autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [icon autoSetDimension:ALDimensionWidth toSize:60];
    [icon autoSetDimension:ALDimensionHeight toSize:60];
    
    //昵称
    UILabel *name=[[UILabel alloc]init];
    name.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:name];
    _name=name;
    [name autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [name autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:icon withOffset:10];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
