//
//  QuickGainCalcViewController.h
//  QuickGainCalc
//
//  Created by Kyle Isom on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KI_StockDelta.h"

@interface QuickGainCalcViewController : UIViewController
{
    KI_StockDelta *stockDelta;
    
    IBOutlet UITextField *buyPriceTF;
    IBOutlet UITextField *sellPriceTF;
    IBOutlet UITextField *sharesTF;
    IBOutlet UITextField *yieldTF;
    IBOutlet UITextField *gainTF;
    
}

- (IBAction)doCalcGainYieldFromDelta:(id)sender;
- (IBAction)doCalcSellFromReturn:(id)sender;
- (IBAction)doCalcSellFromGain:(id)sender;
- (void) updateFields;

@end
