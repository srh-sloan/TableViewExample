//
//  AppDelegate.h
//  HelloWorldDesktop
//
//  Created by Sarah Parrott on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource> 

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView * toDoTableView;

@property (assign) NSMutableArray * toDoList;

@end
