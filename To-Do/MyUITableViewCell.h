//
//  MyUITableViewCell.h
//  To-Do
//
//  Created by Kevin on 7/29/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"


@interface MyUITableViewCell : UITableViewCell

@property (strong,nonatomic) ToDoEntity *localToDoEntity;
@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDueDateLabel;

- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity;

@end
