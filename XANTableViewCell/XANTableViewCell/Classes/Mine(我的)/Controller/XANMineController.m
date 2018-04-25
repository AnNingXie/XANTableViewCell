//
//  XANMineController.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//  自定义cell第二种方式  第一种见首页控制器

#import "XANMineController.h"
#import "XANMeStatus.h"
#import "XANMeTableViewCell.h"
@interface XANMineController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *statusList;
@end

@implementation XANMineController
-(instancetype)init{
    if (self=[super init]) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        tableView.rowHeight=80;
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
        for (int i=0; i<10; i++) {
            XANMeStatus *status=[[XANMeStatus alloc]init];
            status.name=@"天涯";
            status.icon=@"http://app.qingdaobeilin.cn/img/59fc174146596.jpeg";
            [self.statusList addObject:status];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

#pragma mark----UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XANMeTableViewCell *cell=[XANMeTableViewCell cellWithTableView:tableView];
    XANMeStatus *status=self.statusList[indexPath.row];
    cell.status=status;
    return cell;
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


-(NSMutableArray *)statusList{
    if(!_statusList){
        _statusList=[NSMutableArray array];
    }
    return _statusList;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
