//
//  AppDelegate.h
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/17/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSArray*)getAllFlights;

@end
