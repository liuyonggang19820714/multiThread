//
//  ViewController.m
//  multiThread
//
//  Created by 极客学院 on 16/4/7.
//  Copyright © 2016年 极客学院. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

void* run(void*pParam)
{
    NSThread*thread1 = [NSThread currentThread];
    thread1.name = @"run";
    NSLog(@"run 线程 ＝ %@",thread1);
    
    // 耗时操作
//    for (int i = 0; i < 10000; i++) {
//        NSString*str = [NSString stringWithFormat:@"i = %d",i];
//        NSLog(str,nil);
//    }
    
    // 获取当前进程的主线程
   // NSLog(@"主线程 = %@",[NSThread mainThread]);
    
    NSLog(@"子线程栈大小：%d",[NSThread currentThread].stackSize/1024);
    
    return NULL;
}

- (IBAction)btnClick:(id)sender {
    
//    pthread_t threadID;
//    int iReturn = pthread_create(&threadID, NULL, run, NULL);
//    
//    NSThread*thread1 = [NSThread currentThread];
//    NSLog(@"btnClick 线程 ＝ %@",thread1);
//    
//    // 获取当前进程的主线程
//    NSLog(@"主线程栈大小：%d",[NSThread mainThread].stackSize/1024);
    
    // 创建线程 NSThread
    NSThread*thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run100:) object:@"1"];

    // 启动线程
    [thread1 start];
    thread1.threadPriority = 0.1;
    
    // 创建线程 NSThread
    NSThread*thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(run100:) object:@"2"];
    
    // 启动线程
    [thread2 start];
    thread2.threadPriority = 0.9;
}

-(void)run100:(NSString*)strParam
{
    for (int i = 0; i < 100; i++) {
        
        NSLog(@"线程是:%@,参数是%@",[NSThread currentThread],strParam);
    }
}
@end
