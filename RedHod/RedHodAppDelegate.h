//
//  RedHodAppDelegate.h
//  RedHod
//
//  Created by Thiago Silva on 8/17/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *fileName;

@class RedHodViewController;

@interface RedHodAppDelegate : UIResponder <UIApplicationDelegate> {

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RedHodViewController *viewController;

@end
