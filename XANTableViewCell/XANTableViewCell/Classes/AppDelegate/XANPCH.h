//
//  XANPCH.h
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//


//获得RGB颜色
#define XANRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//宽
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
//高
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

//苹果IPhoneX
#define IPhoneX ([UIScreen mainScreen].bounds.size.height==812)


//导航栏高度
#define NaviHeight IPhoneX ? 88 : 64
//Tabbar高度
#define TabbarHeight IPhoneX ? 83 : 49
//底部高度
#define BottomHeight IPhoneX ? 34 : 0
//有tabbar就用TabbarHeight，没有就用BottomHeight

//自定义Log
#ifdef DEBUG
#define XANLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define XANLog(...)
#endif












