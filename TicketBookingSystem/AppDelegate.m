//
//  AppDelegate.m
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/17/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import "AppDelegate.h"
#import "Record.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (![[NSUserDefaults standardUserDefaults]
          boolForKey:@"HasLaunchedOnce"]) { [[NSUserDefaults
                                              standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        Record * firstFlight =
        [NSEntityDescription
         insertNewObjectForEntityForName:@"Record"
         inManagedObjectContext:self.managedObjectContext];
        firstFlight.cityFrom = @"Челябинск";
        firstFlight.cityTo = @"Москва";
        firstFlight.aviaCompany = @"Аэрофлот"; firstFlight.price = [NSNumber
                                            numberWithInt:1000.0];
        
        Record * secondFlight =
        [NSEntityDescription
         insertNewObjectForEntityForName:@"Record"
         inManagedObjectContext:self.managedObjectContext];
        secondFlight.cityFrom = @"Челябинск";
        secondFlight.cityTo = @"Москва"; 
        secondFlight.aviaCompany = @"ЧелАвиа";
        secondFlight.price = [NSNumber numberWithInt:2000.0];
        
        Record * thirdFlight = [NSEntityDescription insertNewObjectForEntityForName: @"Record"                                                             inManagedObjectContext:self.managedObjectContext];
        thirdFlight.cityFrom = @"Екатеринбург";
        thirdFlight.cityTo = @"Уфа";
        thirdFlight.aviaCompany = @"Аэрофлот";
        thirdFlight.price = [NSNumber numberWithInt:500.0];
        
        Record * fourthFlight = [NSEntityDescription insertNewObjectForEntityForName: @"Record"
         inManagedObjectContext:self.managedObjectContext];
        fourthFlight.cityFrom = @"Челябинск";
        fourthFlight.cityTo = @"Уфа";
        fourthFlight.aviaCompany = @"РусЛайн";
        fourthFlight.price = [NSNumber numberWithInt:1500.0];
        
        Record * fivthFlight =
        [NSEntityDescription
         insertNewObjectForEntityForName:@"Record"
         inManagedObjectContext:self.managedObjectContext];
        fivthFlight.cityFrom = @"Екатеринбург";
        fivthFlight.cityTo = @"Москва"; 
        fivthFlight.aviaCompany = @"Аэрофлот"; 
        fivthFlight.price = [NSNumber numberWithInt:800.0]; 
        [self saveContext]; 
    }
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "tp.lab8_3" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    if(_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if(_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType       configuration:nil URL:storeURL options:nil error:&error])
    {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
        
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if(_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator =  [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

-(void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if(managedObjectContext != nil)
    {
        NSError *error = nil;
        if([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

-(NSArray*)getAllFlights
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return fetchedRecords;
}

@end