//
//  CDVBridge.h
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import <Cordova/CDVPlugin.h>

@interface CDVBridge : CDVPlugin

- (void)set:(CDVInvokedUrlCommand*)command;
- (void)get:(CDVInvokedUrlCommand*)command;

@end
