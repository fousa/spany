//
//  SpanyAppDelegate.h
//  Spany
//
//  Created by Jelle Vandebeeck on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpanyAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet id menu;
	IBOutlet id window;
	
	NSStatusItem *statusItem;
}

@end
