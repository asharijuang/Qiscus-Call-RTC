//
//  QiscusCall.m
//  Qiscus_VideoCall_IOS
//
//  Created by Qiscus on 07/05/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "QiscusCall.h"
#import <React/RCTLog.h>

@implementation QiscusCall

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setup:(NSString *)appID appSecret:(NSString *)appSecret appName:(NSString *)appName) {
  RCTLogInfo(@"setup Streaming %@", appID);
  self.client   = [QiscusRTC shared];
  [QiscusRTC configWithAppId:appID appSecret:appSecret appName:appName];
}

RCT_EXPORT_METHOD(callRegister:(NSString *)username displayName:(NSString *)displayName) {
  RCTLogInfo(@"setup Streaming %@", username);
  [QiscusRTC registerWithUsername:username displayName:displayName avatarUrl:@"http://"];
}

RCT_EXPORT_METHOD(startCall:(NSString *)roomID isVideo:(BOOL *)isVideo calleeUsername:(NSString *)calleeUsername calleeDisplayname:(NSString *)calleeDisplayname calleeDisplayAvatar:(NSString *)calleeDisplayAvatar) {
  RCTLogInfo(@"create Streaming");
  
  [QiscusRTC startCallWithRoomId:@"" isVideo:YES calleeUsername:@"" calleeDisplayName:@"" calleeDisplayAvatar:@"http://" completionHandler:^(UIViewController * target, NSError * error) {
      dispatch_async(dispatch_get_main_queue(), ^{
          target.modalPresentationStyle = UIModalPresentationFullScreen;
          AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
          [delegate.rootViewController presentViewController:target animated:YES completion:nil];
      });
  }];
};

@end