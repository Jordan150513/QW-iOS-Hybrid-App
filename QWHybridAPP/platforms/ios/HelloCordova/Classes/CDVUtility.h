//
//  CDVUtility.h
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import <Cordova/CDVPlugin.h>

@interface CDVUtility : CDVPlugin
/** 显示菊花 */
- (void)showActivity:(CDVInvokedUrlCommand*)command;
/** 隐藏菊花 */
- (void)hideActivity:(CDVInvokedUrlCommand*)command;
/** 显示toast */
- (void)toast:(CDVInvokedUrlCommand*)command;
@end
