//
//  AppDelegate.h
//  TableView
//
//  Created by Omnipresent on 17/02/14.
//  Copyright (c) 2014 iOSCuriosity. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    ViewController *viewObj;
    UINavigationController *navObj;
}

@property (strong, nonatomic) ViewController *viewObj;
@property (strong, nonatomic) UINavigationController *navObj;
@property (strong, nonatomic) UIWindow *window;

@end
