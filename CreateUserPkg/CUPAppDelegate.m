//
//  CUPAppDelegate.m
//  CreateUserPkg
//
//  Created by Per Olofsson on 2012-06-27.
//  Copyright (c) 2012 University of Gothenburg. All rights reserved.
//

#import "CUPAppDelegate.h"
#import "CUPBestHostFinder.h"
#import "CUPPreferences.h"

@implementation CUPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    preferencesController = [[CUPPreferences alloc] initWithWindowNibName:@"CUPPreferences"];
    
    [CUPBestHostFinder bestHostFinder];
}

- (IBAction)openPreferencesAction:(id)sender
{
    [preferencesController showWindow:self];
}

- (void)dealloc
{
    [preferencesController release];
    [super dealloc];
}

@end
