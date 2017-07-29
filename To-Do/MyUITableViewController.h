//
//  MyUITableViewController.h
//  To-Do
//
//  Created by Kevin on 7/26/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"

@interface MyUITableViewController : UITableViewController <DPHandlesMOC>

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC;


@end
