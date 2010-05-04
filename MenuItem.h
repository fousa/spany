//
//  MenuItem.h
//  Spany
//
//  Created by Jelle Vandebeeck on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MenuItem : NSView {
	id delegate;
}

- (void)sendFileWithPath:(NSString *)filePath;

@property (retain, nonatomic) id delegate;

@end
