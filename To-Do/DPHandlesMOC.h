//
//  DPHandlesMOC.h
//  To-Do
//
//  Created by Kevin on 7/26/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPHandlesMOC <NSObject>

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC;

@end
