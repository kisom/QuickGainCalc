//
//  QuickGainCalcViewController.m
//  QuickGainCalc
//
//  Created by Kyle Isom on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuickGainCalcViewController.h"

@implementation QuickGainCalcViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    stockDelta = [[KI_StockDelta alloc] init];
    [self updateFields];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) updateFields
{
    NSString *currencyFormat = @"%0.2f";
    [buyPriceTF setText:[NSString stringWithFormat:currencyFormat, [stockDelta buyPrice]]];
    [sellPriceTF setText:[NSString stringWithFormat:currencyFormat, [stockDelta sellPrice]]];
    [sharesTF setText:[NSString stringWithFormat:@"%d", [stockDelta shares]]];
    [yieldTF setText:[NSString stringWithFormat:@"%0.3f", [stockDelta yield]]];
    [gainTF setText:[NSString stringWithFormat:currencyFormat, [stockDelta gain]]];
}

@end
