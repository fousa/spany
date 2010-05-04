//
//  SpanyAppDelegate.m
//  Spany
//
//  Created by Jelle Vandebeeck on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpanyAppDelegate.h"

#import "MenuItem.h"

@implementation SpanyAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	
	statusItem = [bar statusItemWithLength:NSVariableStatusItemLength];
	[statusItem retain];
	
	//[statusItem setImage:[NSImage imageNamed:@"menu-item"]];
	MenuItem *customView = [[MenuItem alloc] initWithFrame:NSMakeRect(0, 0, 100, 2)];
	[customView registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
	customView.delegate = self;
	
	[statusItem setView:customView];
	[statusItem setHighlightMode:YES];
	[statusItem setMenu:menu];
}

- (void)openMenu {
	[menu setDelegate:self];
	[statusItem popUpStatusItemMenu:menu];
}

@end
