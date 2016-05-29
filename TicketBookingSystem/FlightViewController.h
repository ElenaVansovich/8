//
//  FlightViewController.h
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/29/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Record.h"

@interface FlightViewController : UIViewController
-(void)showFlight: (Record*) record;
@end
