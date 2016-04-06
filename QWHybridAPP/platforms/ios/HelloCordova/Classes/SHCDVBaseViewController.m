//
//  SHCDVBaseViewController.m
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import "SHCDVBaseViewController.h"
#import "CDVNavigationBar.h"
#import "CDVBridge.h"
#import "CDVUtility.h"

@interface SHCDVBaseViewController ()

@end

@implementation SHCDVBaseViewController
- (instancetype)initWithFolderName:(NSString *)wwwFolderName {
    self = [super init];
    if (self) {
        self.wwwFolderName = wwwFolderName;
        [self registerPlugins];
    }
    return self;
}

- (instancetype)initWithStartPage:(NSString *)startPage {
    self = [super init];
    if (self) {
        self.wwwFolderName = @"www";
        self.startPage = startPage;
        [self registerPlugins];
    }
    return self;
}

- (instancetype)initWithFolderName:(NSString *)wwwFolderName
                         startPage:(NSString *)startPage {
    self = [super init];
    if (self) {
        self.wwwFolderName = wwwFolderName;
        self.startPage = startPage;
        [self registerPlugins];
    }
    return self;
}

- (instancetype)initWithOpenURL:(NSString *)url {
    self = [super init];
    if (self) {
        self.startPage = url;
        [self registerPlugins];
    }
    return self;
}

- (void)registerPlugins {
    // 添加导航栏插件
    [self registerPlugin:[CDVNavigationBar new] withPluginName:@"CDVNavigationBar"];
    // Bridge插件
    [self registerPlugin:[CDVBridge new] withPluginName:@"CDVBridge"];
    // Utility插件
    [self registerPlugin:[CDVUtility new] withPluginName:@"CDVUtility"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    self.view.backgroundColor = [UtilityHelper colorWithHexString:@"#fafafa"];
    //
    //    if (IOS7DEVICE) {
    //        self.navigationController.navigationBar.translucent = NO;
    //    } else {
    //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //    }
    
    // 创建返回按钮
    [self createBackFowardButton];
}

-(void)createBackFowardButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 16)];
    [button setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    //    if (IOS7DEVICE)
    //    {
    //        [button setFrame:CGRectMake(0, 0, 34, 16)];
    //        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    //    }
    [button addTarget:self action:@selector(backForword) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)backForword {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebDelegate implementation

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //[self.view showActivityViewAtCenter];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //[self.view hideActivityViewAtCenter];
    //webView.backgroundColor = [UtilityHelper colorWithHexString:@"#fafafa"];
    webView.backgroundColor = [UIColor whiteColor];
    //    webView.scrollView.bounces = NO;
    //return [super webViewDidFinishLoad:webView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //[self.view hideActivityViewAtCenter];
    //[UIToastView showToastViewWithContent:@"网络请求失败，请稍后重试"  andTime:2.0f andObject:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self backForword];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
