//
//  ViewController.m
//  LEHOSTDemo
//
//  Created by Anand Avasthy on 02/06/20.
//  Copyright © 2020 Anand Avasthy. All rights reserved.
//

#import "ViewController.h"
#import <LiveEnsureSDK/LiveEnsureSDK.h>

@interface ViewController ()<LiveEnsureDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtFldSession;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (IBAction)btnSessionStartAction:(id)sender {
    NSString *strValidSession = @"";
    if ([_txtFldSession.text isEqualToString:@""]) {
        // invalid session token
        strValidSession = @"sxlskL8ZOaLq6o6E80zfeUhx";
    }else{
        strValidSession = _txtFldSession.text;
    }
    [[LiveEnsureSDK sharedInstance] authenticateWithSessionToken:strValidSession delegate:self];

}

-(void)sessionCompletedWithError:(NSString *)errorMessage{
   UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
-(void)sessionComptedWithStatus:(BOOL)status{
    
    
    NSString *statusMessage = status ? @"SUCCESS" : @"FAILED";
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Authentication" message:statusMessage preferredStyle:UIAlertControllerStyleAlert];
      
      [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
      [self presentViewController:alertVC animated:YES completion:nil];
}

@end
