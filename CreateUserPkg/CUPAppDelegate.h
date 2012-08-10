//
//  CUPAppDelegate.h
//  CreateUserPkg
//
//  Created by Per Olofsson on 2012-06-27.
//  Copyright (c) 2012 University of Gothenburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUPPreferences;

@interface CUPAppDelegate : NSObject <NSApplicationDelegate>
{
    CUPPreferences *preferencesController;
}

- (IBAction)openPreferencesAction:(id)sender;

@end
