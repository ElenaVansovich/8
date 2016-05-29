//
//  ViewController.m
//  TicketBookingSystem
//
//  Created by Lena Vansovich on 5/17/16.
//  Copyright (c) 2016 Lena Vansovich. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "AppDelegate.h"
#import "Record.h"
#import "FlightViewController.h"

@interface ViewController ()

@property (nonatomic) int isCity;
@property (nonatomic, strong) MKPointAnnotation *annotationFrom;
@property (nonatomic, strong) MKPointAnnotation *annotationTo;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UITextField *cityFromTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityToTextField;
@property (weak, nonatomic) IBOutlet UIButton *findButton;

@end

@implementation ViewController

- (IBAction)searchFlights:(id)sender {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSArray *flights = [appDelegate getAllFlights];
    for(Record *record in flights)
    {
        if([self.cityFromTextField.text isEqualToString:record.cityFrom] && [self.cityToTextField.text isEqualToString:record.cityTo])
        {
            FlightViewController *flightView =[[FlightViewController alloc] init];
            [self presentViewController:flightView animated:YES completion:nil];
            [flightView showFlight:record];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    [self.map addGestureRecognizer:longPressGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)handleLongPressGesture:(UIGestureRecognizer*)sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [sender locationInView:self.map];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CLLocationCoordinate2D coord = [self.map convertPoint:point toCoordinateFromView:self.map];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if(error)
             {
                 NSLog(@"Geocode failed with error: %@", error);
                 return;
             }
             for(CLPlacemark *placemark in placemarks)
             {
                 [self setAnnotationToMap:_isCity :placemark.locality:coord];
             }
         
         }];
    }
}

-(void)setAnnotationToMap:(int)type :(NSString *)title:(CLLocationCoordinate2D)coordinate
{
    if (type == 0)
    {
        [_map removeAnnotation:_annotationFrom];
        _annotationFrom= [[MKPointAnnotation alloc] init];
        _annotationFrom.title = title;
        _annotationFrom.coordinate = coordinate;
        [_map addAnnotation:_annotationFrom];
        self.cityFromTextField.text = title;
    }
    else {
        [_map removeAnnotation:_annotationTo];
        _annotationTo= [[MKPointAnnotation alloc] init];
        _annotationTo.title = title;
        _annotationTo.coordinate = coordinate;
        [_map addAnnotation:_annotationTo];
        self.cityToTextField.text = title;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.cityFromTextField)
        _isCity = 0;
    else if (textField == self.cityToTextField)
        _isCity = 1;
    [textField resignFirstResponder]; 
}

@end
