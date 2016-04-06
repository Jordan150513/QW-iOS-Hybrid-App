//
//  CDVBridge.m
//  HelloCordova
//
//  Created by 乔丹丹 on 16/4/6.
//
//

#import "CDVBridge.h"
#import <objc/runtime.h>

@implementation CDVBridge
- (void)set:(CDVInvokedUrlCommand *)command {
    id arg = command.arguments[0];
    NSString * key   = [arg objectForKey:@"key"];
    NSString * value = [arg objectForKey:@"value"];
    CDVPluginResult *pluginResult = nil;
    if([self propertyExistInClass:self.viewController.class propertyName:key]) {
        [self.viewController setValue:value forKey:key];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"成功"];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"key不存在"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)get:(CDVInvokedUrlCommand *)command {
    id arg = command.arguments[0];
    NSArray * keys = [arg objectForKey:@"key"];
    NSMutableDictionary * resultDic = [NSMutableDictionary dictionary];
    NSMutableArray * failedKeyArray = [NSMutableArray array];
    CDVPluginResult *pluginResult = nil;
    for (int i = 0; i < keys.count; i++) {
        NSString * key = keys[i];
        if([self propertyExistInClass:self.viewController.class propertyName:key]) {
            NSString * value = [self.viewController valueForKey:key];
            if (!value) {
                value = @"";
            }
            [resultDic setObject:value forKey:key];
        } else {
            [failedKeyArray addObject:key];
        }
    }
    if (failedKeyArray.count > 0) {
        NSString * msg = [NSString stringWithFormat:@"key:%@不存在", [failedKeyArray componentsJoinedByString:@","]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:msg];
    } else {
        // NSDictionary -> json string
        NSError *error = nil;
        NSData *jsonData =
        [NSJSONSerialization dataWithJSONObject:resultDic
                                        options:NSJSONWritingPrettyPrinted
                                          error:&error];
        if ([jsonData length] > 0 && error == nil){
            NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                         encoding:NSUTF8StringEncoding];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:jsonString];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.description];
        }
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/** 检查指定类中是否有指定的属性 */
- (BOOL)propertyExistInClass:(Class)class propertyName:(NSString *)name {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(class, &count);
    for (int i = 0; i < count; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        if ([keyName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

@end
