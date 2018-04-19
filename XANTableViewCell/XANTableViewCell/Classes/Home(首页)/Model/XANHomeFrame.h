//
//  XANHomeFrame.h
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XANHomeStatus;
@interface XANHomeFrame : NSObject
/** 头像frame */
@property (nonatomic, assign) CGRect iconFrame;
/** 名字frame */
@property (nonatomic, assign) CGRect nameFrame;
/** 内容frame */
@property (nonatomic, assign) CGRect contentFrame;

/** 行高 */
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) XANHomeStatus *status;

@end
