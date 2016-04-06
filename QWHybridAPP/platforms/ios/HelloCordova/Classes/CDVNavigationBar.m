//
//  CDVNavigationBar.m
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import "CDVNavigationBar.h"
#import <objc/runtime.h>

static void * CDVButtonActionKey = "CDVButtonActionKey";

@implementation CDVNavigationBar
- (void)setTitle:(CDVInvokedUrlCommand*)command {
    id arg = command.arguments[0];
    NSString * title = [arg objectForKey:@"title"];
    [self.viewController setTitle:title];
}

- (void)setRightBarButtonItem:(CDVInvokedUrlCommand*)command {
    id arg = command.arguments[0];
    NSString * title = [arg objectForKey:@"title"];
    CGFloat fontSize = [[arg objectForKey:@"fontSize"] floatValue];
    NSString * action = [arg objectForKey:@"action"];
    // 添加按钮
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.viewController.navigationItem.rightBarButtonItem = rightButtonItem;
    
    objc_setAssociatedObject(button, CDVButtonActionKey, action, OBJC_ASSOCIATION_COPY);
}

- (void)onClickLeftBarButtonItem:(CDVInvokedUrlCommand*)command {
    id arg = command.arguments[0];
    NSString * action = [arg objectForKey:@"action"];
    UIButton * button = [self.viewController.navigationItem.leftBarButtonItem valueForKey:@"view"];
    if (button) {
        // 移除原来所有的事件
        [button removeTarget:self.viewController action:nil forControlEvents:UIControlEventAllEvents];
        // 添加新的事件
        [button addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        objc_setAssociatedObject(button, CDVButtonActionKey, action, OBJC_ASSOCIATION_COPY);
    }
}

- (void)popViewController:(CDVInvokedUrlCommand*)command {
    id arg = command.arguments[0];
    BOOL animated = [[arg objectForKey:@"animated"] boolValue];
    [self.viewController.navigationController popViewControllerAnimated:animated];
}

#pragma mark - Private Method

- (void)rightButtonClick:(UIButton *)button {
    NSString * action = objc_getAssociatedObject(button, CDVButtonActionKey);
    [self.commandDelegate evalJs:[action stringByAppendingString:@"()"]];
}

- (void)leftButtonClick:(UIButton *)button {
    NSString * action = objc_getAssociatedObject(button, CDVButtonActionKey);
    [self.commandDelegate evalJs:[action stringByAppendingString:@"()"]];
}
@end
