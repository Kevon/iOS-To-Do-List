//
//  ToDoEntity+CoreDataProperties.h
//  To-Do
//
//  Created by Kevin on 8/1/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *toDoEndDate;
@property (nullable, nonatomic, retain) NSString *toDoLocation;
@property (nullable, nonatomic, retain) NSString *toDoTitle;

@end

NS_ASSUME_NONNULL_END
