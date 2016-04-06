//
//  SHCDVBaseViewController.h
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//
#import <Cordova/CDVViewController.h>
//#import <Cordova/Cordova.h>

@interface SHCDVBaseViewController : CDVViewController
/** startpage 默认为index.html */
- (instancetype)initWithFolderName:(NSString *)wwwFolderName;

/** wwwFolder 默认为www */
- (instancetype)initWithStartPage:(NSString *)startPage;

/** 同时指定wwwFolder和startPage */
- (instancetype)initWithFolderName:(NSString *)wwwFolderName
                         startPage:(NSString*)startPage;

/** 指定URL地址 e.g. http://www.baidu.com/ */
- (instancetype)initWithOpenURL:(NSString *)url;

@end
