//
//  CDVUtility.m
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import "CDVUtility.h"
#import <objc/runtime.h>

@implementation CDVUtility
- (void)showActivity:(CDVInvokedUrlCommand *)command {
    //[self.viewController.view showActivityViewAtCenter];
}

- (void)hideActivity:(CDVInvokedUrlCommand *)command {
    // [self.viewController.view hideActivityViewAtCenter];
}

- (void)toast:(CDVInvokedUrlCommand*)command {
    id arg = command.arguments[0];
    NSString * title = [arg objectForKey:@"title"];
    CGFloat time = [[arg objectForKey:@"time"] floatValue];
    //[UIToastView showToastViewWithContent:title andTime:time andObject:self.viewController];
}
@end
