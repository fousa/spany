//
//  MenuItem.m
//  Spany
//
//  Created by Jelle Vandebeeck on 03/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MenuItem.h"


@implementation MenuItem

@synthesize delegate;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor redColor] set];
	NSRectFill(dirtyRect);
}

- (void)draggingEnded:(id <NSDraggingInfo>)sender {
	NSLog(@"performDragOperation");
	NSPasteboard *pasteBoard = [sender draggingPasteboard];
	NSArray *files = [pasteBoard propertyListForType:NSFilenamesPboardType];
	for (NSString *file in files) {
		NSLog(@"file: %@", file);
		[self sendFileWithPath:file];
	}
}

- (void)sendFileWithPath:(NSString *)filePath {
	NSString *urlString = [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"spicUrl"];
	NSString *secret = [[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"personalJesus"];
	
	NSLog(@"prt: %@", secret);
	
	NSURL *url = [NSURL URLWithString:urlString];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
														cachePolicy:NSURLRequestReloadIgnoringCacheData
													    timeoutInterval:30.0];
	
	[request setHTTPMethod:@"POST"];
	[request addValue:@"multipart/form-data; boundary=0xKhTmLbOuNdArY" forHTTPHeaderField:@"Content-Type"];
	
	NSMutableData *data = [NSMutableData data];
	[data appendData:[@"--0xKhTmLbOuNdArY\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[@"Content-Disposition: form-data; name=\"secret\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[secret dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[@"\r\n--0xKhTmLbOuNdArY\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"name\"; filename=\"%@\"\r\n", [filePath lastPathComponent]] dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	[data appendData:[NSData dataWithContentsOfFile:filePath]];
	[data appendData:[@"\r\n--0xKhTmLbOuNdArY\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
	
	[request setHTTPBody:data];
	
	NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
	if (connection) {
		NSMutableData *receivedData = [NSMutableData data];
	}
}

- (void)mouseDown:(NSEvent *)event {	
	if ([delegate respondsToSelector:@selector(openMenu)]) {
		[delegate openMenu];
	}
}

@end
