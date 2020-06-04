//
//  LiveEnsureSDK.h
//  LiveEnsureSDK
//
//  Created by Anand Avasthy on 02/06/20.
//  Copyright © 2020 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LiveEnsureDelegate <NSObject>

-(void)sessionComptedWithStatus:(BOOL)status;

-(void)sessionCompletedWithError:(NSString*_Nullable)errorMessage;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LiveEnsureSDK : NSObject 
+(instancetype)sharedInstance;
-(void)authenticateWithSessionToken:(NSString*)sessionToken delegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
