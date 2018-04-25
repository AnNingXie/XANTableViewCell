//
//  XANMeTableViewCell.h
//  XANTableViewCell
//
//  Created by XAN on 2018/4/25.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XANMeStatus;
@interface XANMeTableViewCell : UITableViewCell

@property (nonatomic, strong) XANMeStatus *status;

/**
 *  快速创建一个tableView
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
