//
//  MyUITableViewCell.m
//  To-Do
//
//  Created by Kevin on 7/29/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "MyUITableViewCell.h"

@implementation MyUITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    self.toDoTitleLabel.text = incomingToDoEntity.toDoTitle;
    self.toDoDueDateLabel.text = [dateFormatter stringFromDate:incomingToDoEntity.toDoEndDate];
    self.localToDoEntity = incomingToDoEntity;
    
    NSString *temp = [dateFormatter stringFromDate:incomingToDoEntity.toDoEndDate];
    self.toDoDueDateLabel.text = temp;
}

@end
