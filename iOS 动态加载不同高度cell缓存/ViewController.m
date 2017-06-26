//
//  ViewController.m
//  iOS 动态加载不同高度cell缓存
//
//  Created by 张文勇 on 2017/6/26.
//  Copyright © 2017年 张文勇. All rights reserved.
//

#import "ViewController.h"

#import "ssTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tablleview;

/**
 注释
 */
@property (nonatomic,strong)NSMutableDictionary *dic;

/**
 注释
 */
@property (nonatomic,strong)ssTableViewCell *AACELL;

/**
 注释
 */
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    tableview.dataSource =self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    _tablleview =tableview;
    _dataSource = [NSMutableArray arrayWithCapacity:0];
    
    
    for(int i=0;i<100;i++)
    {
        NSString *str = @"文";
        NSString *ss = @"的我dasdsadasdas的我dasdsadasdas的我dasdsadasdas的我dasdsadasdas的我dasdsadasdas";
        for(int j=0;j<i;j++)
        
        {
            
            str = [NSString stringWithFormat:@"%@%@",str,ss];
        }
        
        [_dataSource addObject:str];
    }
    
    
    
   
    [self registerCell];
    
    _AACELL = [tableview dequeueReusableCellWithIdentifier:@"ssTableViewCell"];
    _dic = [[NSMutableDictionary alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)registerCell
{
    UINib *nib = [UINib nibWithNibName:@"ssTableViewCell" bundle:[NSBundle mainBundle]];
    [_tablleview registerNib:nib forCellReuseIdentifier:@"ssTableViewCell"];
    
}

#pragma == UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataSource.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    // 动态计算cell的高度 有两种方法 一种是提前算出高度 然后加载 第二种方法是用这种方法 缓存起来e
    
    NSNumber *nub = [_dic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
    
    if(nub)
    {
        
        CGFloat hief =[nub floatValue];
        
        return hief;
    }
    else
    {
        _AACELL = [tableView dequeueReusableCellWithIdentifier:@"ssTableViewCell"];
        
        [_AACELL setsting:_dataSource[indexPath.row]];
        
        CGFloat heigth = [_AACELL getgedd];
        
        [_dic setObject: [NSNumber numberWithFloat:heigth] forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
        
        return  heigth;
    }

}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    这只是预估杭高 以至于算出整个cell的方法 
    return 200;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ssTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ssTableViewCell" forIndexPath:indexPath];
    [cell setsting:_dataSource[indexPath.row]];
    return cell;
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tablleview reloadData];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
