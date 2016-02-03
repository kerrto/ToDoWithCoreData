//
//  ToDo+CoreDataProperties.h
//  ToDoItAgain2
//
//  Created by Kerry Toonen on 2016-02-03.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *doDescription;
@property (nullable, nonatomic, retain) NSNumber *priority;
@property (nullable, nonatomic, retain) NSNumber *completed;

@end

NS_ASSUME_NONNULL_END
