//
//  CUPPreferences.h
//  CreateUserPkg
//
//  Created by Juutilainen Hannes on 10.8.2012.
//

#import <Cocoa/Cocoa.h>

@interface CUPPreferences : NSWindowController <NSToolbarDelegate>
{
    NSMutableDictionary *items;
    NSToolbar *toolbar;
}

@property (assign) IBOutlet NSView *generalView;
@property (assign) IBOutlet NSView *advancedView;

- (void)switchViews:(NSToolbarItem *)item;

@end
