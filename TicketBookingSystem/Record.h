//
//  Record.h
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/17/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * aviaCompany;
@property (nonatomic, retain) NSString * cityFrom;
@property (nonatomic, retain) NSString * cityTo;
@property (nonatomic, retain) NSNumber * price;

@end
