//
//  CDVNavigationBar.h
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import <Cordova/CDVPlugin.h>

@interface CDVNavigationBar : CDVPlugin

-(void)setTitle:(CDVInvokedUrlCommand *)command;
-(void)setRightBarButtonItem:(CDVInvokedUrlCommand *)command;
-(void)onClickLeftBarButtonItem:(CDVInvokedUrlCommand *)command;
-(void)popViewController:(CDVInvokedUrlCommand *)command;

@end
