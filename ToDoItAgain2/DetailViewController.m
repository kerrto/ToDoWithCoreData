//
//  DetailViewController.m
//  ToDoItAgain2
//
//  Created by Kerry Toonen on 2016-02-03.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text =[self.detailItem valueForKey:@"title"];
                                            
        self.descriptionLabel.text=[self.detailItem valueForKey:@"doDescription"];
        
        NSNumber *priorityString=[self.detailItem valueForKey:@"priority"];
        self.priorityLabel.text=[priorityString stringValue];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
