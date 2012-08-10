//
//  main.m
//  CreateUserPkg
//
//  Created by Per Olofsson on 2012-06-27.
//  Copyright (c) 2012 University of Gothenburg. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Create the default values
    NSDictionary *userDefaultsValuesDict;
	userDefaultsValuesDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"com.mycompany",             @"DefaultOrganizationID",
                              [NSNumber numberWithInt:499], @"DefaultUserID",
                              @"Administrator",             @"DefaultAccountType",
                              nil];
	
	// Register the defaults
	[[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsValuesDict];
	
    [pool release];
    
    return NSApplicationMain(argc, (const char **)argv);
}
