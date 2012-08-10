//
//  CUPPreferences.m
//  CreateUserPkg
//
//  Created by Juutilainen Hannes on 10.8.2012.
//

#import "CUPPreferences.h"

@interface CUPPreferences ()

@end

@implementation CUPPreferences

@synthesize generalView;
@synthesize advancedView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [items release];
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (void)awakeFromNib
{
    items = [[NSMutableDictionary alloc] init];
    
    // Create the General toolbar item
    NSToolbarItem *generalItem;
    generalItem = [[NSToolbarItem alloc] initWithItemIdentifier:@"General"];
    [generalItem setPaletteLabel:@"General"];
    [generalItem setLabel:@"General"];
    [generalItem setToolTip:@"General preference options."];
    [generalItem setImage:[NSImage imageNamed:@"NSPreferencesGeneral"]];
    [generalItem setTarget:self];
    [generalItem setAction:@selector(switchViews:)];
    [items setObject:generalItem forKey:@"General"];
    [generalItem release];
    
    // Create the Advanced toolbar item
    NSToolbarItem *advancedItem;
	advancedItem = [[NSToolbarItem alloc] initWithItemIdentifier:@"Advanced"];
    [advancedItem setPaletteLabel:@"Advanced"];
    [advancedItem setLabel:@"Advanced"];
    [advancedItem setToolTip:@"Advanced options."];
    [advancedItem setImage:[NSImage imageNamed:@"NSAdvanced"]];
    [advancedItem setTarget:self];
    [advancedItem setAction:@selector(switchViews:)];
    [items setObject:advancedItem forKey:@"Advanced"];
    [advancedItem release];
    
    // Create the toolbar
    toolbar = [[[NSToolbar alloc] initWithIdentifier:@"preferencePanes"] autorelease];
    [toolbar setDelegate:self];
    [toolbar setAllowsUserCustomization:NO];
    [toolbar setAutosavesConfiguration:NO];
    
    // Attach the toolbar and configure our window
    [self.window setToolbar:toolbar];
    [self.window setShowsResizeIndicator:YES];
    [self.window setShowsToolbarButton:NO];
    [self.window center];
    [self.window makeKeyAndOrderFront:self];
    
    // Make the initial selection
    [self switchViews:nil];
}

- (void)clearMainWindowContentView
{
    // Create an empty temporary view
    NSView *tempView = [[NSView alloc] initWithFrame:[[self.window contentView] frame]];
    [self.window setContentView:tempView];
    [tempView release];
}

- (void)resizeWindowToFitView:(NSView *)newView animate:(BOOL)shouldAnimate
{
    // Resize the window
    NSRect newFrame = [self.window frame];
    newFrame.size.height = [newView frame].size.height + ([self.window frame].size.height - [[self.window contentView] frame].size.height);
    newFrame.size.width = [newView frame].size.width;
    newFrame.origin.y += ([[self.window contentView] frame].size.height - [newView frame].size.height);
    
    [self.window setFrame:newFrame display:YES animate:shouldAnimate];
}

- (void)switchViews:(NSToolbarItem *)item
{
    NSString *selectedItemTitle;
    if (item == nil)
    {
        selectedItemTitle = @"General";
        [toolbar setSelectedItemIdentifier:selectedItemTitle];
    }
    else
    {
        selectedItemTitle = [item label];
    }
    [self.window setTitle:selectedItemTitle];
    
    
    NSView *preferencesView;
    if ([selectedItemTitle isEqualToString:@"General"])
    {
        preferencesView = self.generalView;
    }
    else if ([selectedItemTitle isEqualToString:@"Advanced"])
    {
        preferencesView = self.advancedView;
    }
    else
    {
        preferencesView = self.generalView; // Just in case
    }
    
    [self clearMainWindowContentView];
    [self resizeWindowToFitView:preferencesView animate:YES];
    [self.window setContentView:preferencesView];
}

# pragma mark -
# pragma mark NSToolbar delegate methods

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    return [items objectForKey:itemIdentifier];
}

- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar*)theToolbar
{
    return [self toolbarDefaultItemIdentifiers:theToolbar];
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar*)theToolbar
{
    return [NSArray arrayWithObjects:@"General", @"Advanced", nil];
}

- (NSArray *)toolbarSelectableItemIdentifiers: (NSToolbar *)toolbar
{
    return [items allKeys];
}

@end
