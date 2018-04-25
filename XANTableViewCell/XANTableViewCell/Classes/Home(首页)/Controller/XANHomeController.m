//
//  XANHomeController.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//  自定义cell第一种方式  第二种见我的控制器

#import "XANHomeController.h"
#import "XANHomeTableViewCell.h"
#import "XANHomeFrame.h"
#import "XANHomeStatus.h"
@interface XANHomeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *statusFrame;
@end

@implementation XANHomeController
-(instancetype)init{
    if (self=[super init]) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        tableView.delegate=self;
        tableView.dataSource=self;
        [self.view addSubview:tableView];
        _tableView=tableView;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self getData];
}

/**
 获取网络数据
 */
-(void)getData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0; i<20; i++) {
            XANHomeStatus *status=[[XANHomeStatus alloc]init];
            status.icon=@"http://app.qingdaobeilin.cn/img/59fc174146596.jpeg";
            status.name=@"平丫";
            status.content=@"彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多彻彻底底多多";
            XANHomeFrame *statusFrame=[[XANHomeFrame alloc]init];
            statusFrame.status=status;
            [self.statusFrame addObject:statusFrame];
        }
        dispatch_async(dispatch_get_main_queue(), ^{//回到主线程刷新界面
            [self.tableView reloadData];
        });
    });
}

#pragma mark----UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrame.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XANHomeTableViewCell *cell=[XANHomeTableViewCell cellWithTableView:tableView];
    cell.homeFrame=self.statusFrame[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XANHomeFrame *homeFrame=self.statusFrame[indexPath.row];
    return homeFrame.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

#pragma mark---数组懒加载
-(NSMutableArray *)statusFrame{
    if(!_statusFrame){
        _statusFrame=[NSMutableArray array];
    }
    return _statusFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
