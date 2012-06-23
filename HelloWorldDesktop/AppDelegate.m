//
//  AppDelegate.m
//  HelloWorldDesktop
//
//  Created by Sarah Parrott on 23/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate 

@synthesize window = _window;
@synthesize toDoList; 
@synthesize toDoTableView;

NSString *const toDoColId = @"toDoCol";

- (void)dealloc
{
    [self.toDoList dealloc];
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"App did finish launching");
    // Insert code here to initialize your application
  //  toDoList = [[NSMutableArray alloc] init];
    toDoList = [[NSMutableArray alloc] initWithObjects:@"item 1", @"item 2", nil];
    NSLog(@"table view %@", self.toDoTableView);
    [self.toDoTableView reloadData];
    NSLog(@"table view %@", self.toDoTableView);
    
}

//check toDoList initialised before we try and return the size
- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    
    NSLog(@"table view %@", self.toDoTableView);
    NSInteger count = 0;
    if(self.toDoList){
        count = [toDoList count];
    } else{
        NSLog(@"to do list is nil");
    }
    NSLog(@"Number of rows is %ld", count);
    return count;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
   // NSLog(@"in objectValueForTable");
    id returnVal = nil;
    
    NSString * colId = [tableColumn identifier];
    
    NSString * item = [self.toDoList objectAtIndex:row];
    
    if([colId isEqualToString:toDoColId]){
        returnVal = item;
    } 
    
    return returnVal;
    
}

-(void) tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSLog(@"In setObjectValue:forTableColumn:row: %@", object);
    NSString *colId = [tableColumn identifier];
    if([colId isEqualToString: toDoColId]){
        [self.toDoList replaceObjectAtIndex: row withObject: object];
    }
}

@end
