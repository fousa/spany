//
//  MenuItemController.m
//  Spany
//
//  Created by Jelle Vandebeeck on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MenuItemController.h"


@implementation MenuItemController

- (IBAction)openPreferencePane:(id)sender {
	[[NSWorkspace sharedWorkspace] launchAppWithBundleIdentifier:@"be.fousa.spany.preferencepane"
								   options:NSWorkspaceLaunchAsync
								   additionalEventParamDescriptor:nil
								   launchIdentifier:nil];
	
}

@end
