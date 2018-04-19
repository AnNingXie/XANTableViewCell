//
//  XANHomeTableViewCell.h
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XANHomeFrame;
@interface XANHomeTableViewCell : UITableViewCell

@property (nonatomic, strong) XANHomeFrame *homeFrame;

/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
