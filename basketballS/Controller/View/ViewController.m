//
//  ViewController.m
//  basketballS
//
//  Created by Apple on 2019/4/10.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "MainData_H.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (weak, nonatomic) IBOutlet UIButton *hotBtn;
@property (weak, nonatomic) IBOutlet UIButton *NbaBtn;
@property (weak, nonatomic) IBOutlet UIButton *CbaBtn;

@property NSMutableArray * TitleData;
@property NSMutableArray * ImgData;
@property NSMutableArray * IdData;

@end

NSString *titleKey, *imageURL;
int page;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首頁";
    titleKey = @"HOT";
    page = 0;
    
    [self.hotBtn setTitleColor:[UIColor colorWithRed:223.0f/255.0f
                                               green:94.0f/255.0f
                                                blue:0.0f/255.0f
                                               alpha:1.0f] forState:UIControlStateNormal];
    [self initArray_btn];
}

-(void)initArray_btn{
    _TitleData = [[NSMutableArray alloc] init];
    _ImgData = [[NSMutableArray alloc] init];
    _IdData = [[NSMutableArray alloc] init];
    
    [self.hotBtn addTarget:self
                  action:@selector(hotClicked:)
        forControlEvents:UIControlEventTouchUpInside
     ];
    [self.NbaBtn addTarget:self
                    action:@selector(NbaClicked:)
          forControlEvents:UIControlEventTouchUpInside
     ];
    [self.CbaBtn addTarget:self
                    action:@selector(CbaClicked:)
          forControlEvents:UIControlEventTouchUpInside
     ];
    [self initTable];
}

-(void)initTable{
    self.tableV.dataSource = self;
    self.tableV.delegate =  self;
    [self.tableV setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self getTitleJson];
}

-(void)getTitleJson{
    
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:@"http://47.75.131.189/01c1f06a9576e580f41279e4c2c77378/"];
    NSDictionary *jsonBodyDict = @{@"type":@"title", @"key":titleKey};
    
    //第二步，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //设置请求方式为POST，默认为GET
    [request setHTTPMethod:@"POST"];
    //设置参数
    NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:jsonBodyDict options:kNilOptions error:nil];
    [request setHTTPBody:jsonBodyData];
    //第三步，连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *jsonString = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
        
    MainData_H *Hdata = [[MainData_H alloc] initWithString:jsonString error:nil];
    for(int i = 0 ; i < Hdata.data.count; i += 1){
        DATA *data = Hdata.data[i];
        
        [_TitleData addObject:data.title];
        [_ImgData addObject:data.image];
        [_IdData addObject:data.id];
    }
}

-(void)callJson{
    
    [_TitleData removeAllObjects];
    [_ImgData removeAllObjects];
    [_IdData removeAllObjects];
    
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:@"http://47.75.131.189/01c1f06a9576e580f41279e4c2c77378/"];
    NSDictionary *jsonBodyDict = @{@"type":@"title", @"key":titleKey};
    
    //第二步，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //设置请求方式为POST，默认为GET
    [request setHTTPMethod:@"POST"];
    //设置参数
    NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:jsonBodyDict options:kNilOptions error:nil];
    [request setHTTPBody:jsonBodyData];
    //第三步，连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *jsonString = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    MainData_H *Hdata = [[MainData_H alloc] initWithString:jsonString error:nil];
    for(int i = 0 ; i < Hdata.data.count; i += 1){
        DATA *data = Hdata.data[i];
        
        [_TitleData addObject:data.title];
        [_ImgData addObject:data.image];
        [_IdData addObject:data.id];
    }
    [self.tableV reloadData];
}

-(void)nextJson{
    
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:@"http://47.75.131.189/01c1f06a9576e580f41279e4c2c77378/"];
    NSDictionary *jsonBodyDict = @{@"type":@"title", @"key":titleKey, @"page": [[NSString alloc] initWithFormat:@"%d", page]};
    
    //第二步，创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //设置请求方式为POST，默认为GET
    [request setHTTPMethod:@"POST"];
    //设置参数
    NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:jsonBodyDict options:kNilOptions error:nil];
    [request setHTTPBody:jsonBodyData];
    //第三步，连接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *jsonString = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    MainData_H *Hdata = [[MainData_H alloc] initWithString:jsonString error:nil];
    for(int i = 0 ; i < Hdata.data.count; i += 1){
        DATA *data = Hdata.data[i];
        
        [_TitleData addObject:data.title];
        [_ImgData addObject:data.image];
        [_IdData addObject:data.id];
    }
    [self.tableV reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _TitleData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.HC_lable setText:[_TitleData objectAtIndex:indexPath.row]];
    
    
    imageURL = [NSURL URLWithString:_ImgData[indexPath.row]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            cell.HC_img.image = [UIImage imageWithData:imageData];
        });
    });
    
    
    //cell.item_btn.tag = indexPath.row;
    //[cell.item_btn addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.frame.size.height;
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
    if (bottomOffset <= height)
    {
        //在最底部
        page = page + 1;
        [self nextJson];
    }
    else
    {
        
    }
}

- (void) hotClicked:(id)sender {
    [self.hotBtn setTitleColor:[UIColor colorWithRed:223.0f/255.0f
                                             green:94.0f/255.0f
                                              blue:0.0f/255.0f
                                             alpha:1.0f] forState:UIControlStateNormal];
    [self.NbaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.CbaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    titleKey = @"HOT";
    [self callJson];
}

- (void) NbaClicked:(id)sender {
    [self.NbaBtn setTitleColor:[UIColor colorWithRed:223.0f/255.0f
                                             green:94.0f/255.0f
                                              blue:0.0f/255.0f
                                             alpha:1.0f] forState:UIControlStateNormal];
    [self.hotBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.CbaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    titleKey = @"NBA";
    [self callJson];
}

- (void) CbaClicked:(id)sender {
    [self.CbaBtn setTitleColor:[UIColor colorWithRed:223.0f/255.0f
                                             green:94.0f/255.0f
                                              blue:0.0f/255.0f
                                             alpha:1.0f] forState:UIControlStateNormal];
    [self.hotBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.NbaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    titleKey = @"CBA";
    [self callJson];
}

@end
