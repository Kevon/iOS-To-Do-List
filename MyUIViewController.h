//
//  MyUIViewController.h
//  To-Do
//
//  Created by Kevin on 7/26/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"
#import "DPHandlesToDoEntity.h"


@interface MyUIViewController : UIViewController<DPHandlesMOC, DPHandlesToDoEntity>

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC;
- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;


@end
