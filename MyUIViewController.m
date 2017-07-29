//
//  MyUIViewController.m
//  To-Do
//
//  Created by Kevin on 7/26/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong,nonatomic) ToDoEntity *localToDoEntity;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDateField;
@property (nonatomic, assign) BOOL wasDeleted;
@property (weak, nonatomic) IBOutlet UITextField *locationField;

@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC{
    self.managedObjectContext = incomingMOC;
}

- (void) receiveToDoEntity:(ToDoEntity *)incomingToDoEntity{
    self.localToDoEntity = incomingToDoEntity;
}

/*
- (void) textViewDidEndEditing:(NSNotification *)notification{
    if ([notification object] == self){
        self.localToDoEntity.toDoDetails = self.detailsField.text;
        [self saveMyToDoEntity];
    }
    
    
}
 */

- (void) viewWillAppear:(BOOL)animated{
    self.wasDeleted = NO;
    self.titleField.text = self.localToDoEntity.toDoTitle;
    self.locationField.text = self.localToDoEntity.toDoLocation;
    NSDate *dueDate = self.localToDoEntity.toDoEndDate;
    if(dueDate != nil){
        [self.dueDateField setDate:dueDate];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    
}

- (void) viewWillDisappear:(BOOL)animated{
    if(self.wasDeleted == NO){
    self.localToDoEntity.toDoTitle = self.titleField.text;
    self.localToDoEntity.toDoLocation = self.locationField.text;
    self.localToDoEntity.toDoEndDate = self.dueDateField.date;
    [self saveMyToDoEntity];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
}

- (void) saveMyToDoEntity{
    NSError *err;
    BOOL saveSuccess =[self.managedObjectContext save:&err];
    if(!saveSuccess){
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:nil];
    }
}


- (IBAction)trashTapped:(id)sender {
    self.wasDeleted = YES;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveMyToDoEntity];
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)titleFieldEdited:(id)sender {
    self.localToDoEntity.toDoTitle = self.titleField.text;
    [self saveMyToDoEntity];
}

- (IBAction)dueDateEdited:(id)sender {
    self.localToDoEntity.toDoEndDate = self.dueDateField.date;
    [self saveMyToDoEntity];
}

- (IBAction)locationFieldEdited:(id)sender {
    self.localToDoEntity.toDoLocation = self.locationField.text;
    [self saveMyToDoEntity];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
