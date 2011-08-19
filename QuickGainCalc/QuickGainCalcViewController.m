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

- (void) updateStockDelta
{
    char *sellPriceBuffer = malloc(16);
    char *buyPriceBuffer  = malloc(16);
    char *shareBuffer     = malloc(32);
    char *yieldBuffer     = malloc(16);
    char *gainBuffer      = malloc(16);
    [[sellPriceTF text] getCString:sellPriceBuffer maxLength:15 encoding:NSUTF8StringEncoding];
    [[buyPriceTF text]  getCString:buyPriceBuffer  maxLength:15 encoding:NSUTF8StringEncoding];
    [[sharesTF text]    getCString:shareBuffer     maxLength:31 encoding:NSUTF8StringEncoding];
    [[yieldTF text]     getCString:yieldBuffer     maxLength:15 encoding:NSUTF8StringEncoding];
    [[gainTF text]      getCString:gainBuffer      maxLength:15 encoding:NSUTF8StringEncoding];
    
    double tempSellPrice = atof(sellPriceBuffer);
    double tempBuyPrice  = atof(buyPriceBuffer);
    int tempShares       = atoi(shareBuffer);
    double tempYield     = atof(yieldBuffer);
    double tempGain      = atof(gainBuffer);
    
    if (tempYield > 1) {
        tempYield--;
        tempYield /= 100;
    }
    
    // update the stockDelta
    [stockDelta setBuyPrice:tempBuyPrice];
    [stockDelta setSellPrice:tempSellPrice];
    [stockDelta setShares:tempShares];
    [stockDelta setYield:tempYield];
    [stockDelta setGain:tempGain];
    
    free(sellPriceBuffer);
    free(buyPriceBuffer);
    free(shareBuffer);
    free(yieldBuffer);
    free(gainBuffer);
    
    sellPriceBuffer = NULL;
    buyPriceBuffer  = NULL;
    shareBuffer     = NULL;
    yieldBuffer     = NULL;
    gainBuffer      = NULL;
    

    return;
}

- (IBAction)doCalcGainYieldFromDelta:(id)sender
{
    [self updateStockDelta];
    [stockDelta calcYieldAndGainFromDelta];
    [self updateFields];
}

- (IBAction)doCalcSellFromReturn:(id)sender
{
    [self updateStockDelta];
    [stockDelta calcSellFromYield];
    [self updateFields];
}

- (IBAction)doCalcSellFromGain:(id)sender
{
    [self updateStockDelta];
    [stockDelta calcSellFromGain];
    [self updateFields];
}
@end
