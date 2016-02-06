//
//  AddNewToDoViewController.m
//  ToDoItAgain2
//
//  Created by Kerry Toonen on 2016-02-03.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "AddNewToDoViewController.h"
#import "DetailViewController.h"

@interface AddNewToDoViewController ()

@property (strong, nonatomic) IBOutlet UITextField *titleTF;
@property (strong, nonatomic) IBOutlet UITextField *detailTF;
@property (strong, nonatomic) IBOutlet UITextField *priorityTF;
- (IBAction)saveNewToDo:(id)sender;

@end

@implementation AddNewToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveNewToDo:(id)sender {
    NSString *toDoTitle=self.titleTF.text;
    NSString *toDoDetail=self.detailTF.text;
    NSString *priority=self.priorityTF.text;
    NSInteger intPriority=[priority integerValue];
    NSNumber *numberPriority=[NSNumber numberWithInteger:intPriority];
    
    // Create Managed Object
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *managedObjectContext=del.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ToDo" inManagedObjectContext:managedObjectContext];
    NSManagedObject *newToDo = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:managedObjectContext];
    
    
    
    [newToDo setValue:toDoTitle forKey:@"title"];
    [newToDo setValue:toDoDetail forKey:@"doDescription"];
    [newToDo setValue:numberPriority forKey:@"priority"];
    
    
    
    [del saveContext];
    
    [self performSegueWithIdentifier:@"seeNewItem" sender:newToDo];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"seeNewItem"]) {
        
        
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:sender];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}






@end
