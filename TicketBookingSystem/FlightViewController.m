//
//  FlightViewController.m
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/29/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import "FlightViewController.h"
#import "Record.h"

@interface FlightViewController ()

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end

@implementation FlightViewController

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showFlight: (Record*) record{
    _priceLabel.text = [NSString stringWithFormat:@"%@", record.price];
    _companyLabel.text = record.aviaCompany;
    _destinationLabel.text = record.cityTo;
    _sourceLabel.text = record.cityFrom;
}

@end
