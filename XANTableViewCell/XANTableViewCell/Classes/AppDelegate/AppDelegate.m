//
//  AppDelegate.m
//  XANTableViewCell
//
//  Created by XAN on 2018/4/19.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "AppDelegate.h"
#import "XANTabBarController.h"
#import "SDWebImageManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    XANTabBarController *root=[[XANTabBarController alloc]init];
    self.window.rootViewController=root;
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 当出现内存警告的时候会调用

 @param application <#application description#>
 */
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    SDWebImageManager *manager=[SDWebImageManager sharedManager];
    //1.清除内存缓存
    [manager.imageCache clearMemory];
    //2.取消所有正在下载的操作
    [manager cancelAll];
    
    
    /*
    清除缓存文件   最长缓存时间7天  也就是过期时间7天
    clearMemory:直接删除缓存目录下的文件，然后重新创建新的缓存文件
    cleanMemory:清除过期缓存，从缓存日期从早到晚删除
    
    3.下载图片的最大并发数是 maxConcurrentOperationCount= 6
    4.队列中任务的一个处理方式：FIFO的方式 任务的顺序默认是先进先出的，先加到队列中的任务是先执行的
    5.缓存文件的保存名称如何处理：拿到图片的URL进行MD5加密之后出来一串加密的字符串作为图片的名称
    6.该框架内部对内存警告的处理方式：内部通过监听通知的方式来清理缓存
    
     6.1
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAllObjects) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
     6.2
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(clearMemory)
     name:UIApplicationDidReceiveMemoryWarningNotification
     object:nil];
     
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(deleteOldFiles)
     name:UIApplicationWillTerminateNotification
     object:nil];
     
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(backgroundDeleteOldFiles)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
     
    7.该框架进行缓存处理的方式：NSCache
    8.如何判断图片的类型：获得图片二进制数据的第一个字节，使用第一个字节判断图片的类型
    NSData的一个分类
     #import "NSData+ImageContentType.h"
     + (SDImageFormat)sd_imageFormatForImageData:(nullable NSData *)data {
     if (!data) {
     return SDImageFormatUndefined;
     }
     
     uint8_t c;
     获得图片二进制数据的第一个字节，使用第一个字节判断图片的类型
     [data getBytes:&c length:1];
     switch (c) {
     case 0xFF:
     return SDImageFormatJPEG;
     case 0x89:
     return SDImageFormatPNG;
     case 0x47:
     return SDImageFormatGIF;
     case 0x49:
     case 0x4D:
     return SDImageFormatTIFF;
     case 0x52:
     // R as RIFF for WEBP
     if (data.length < 12) {
     return SDImageFormatUndefined;
     }
     
     NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
     if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
     return SDImageFormatWebP;
     }
     }
     return SDImageFormatUndefined;
     }
     
    
    9.如何下载图片的：发送网络请求  NSURLSession
    10.请求超时时间：默认15秒，downloadTimeout=15
    
    */
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
