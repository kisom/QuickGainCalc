//
//  KI_StockDelta.h
//  QuickGainCalc
//
//  Created by Kyle Isom on 8/19/11.
//  Copyright 2011 Kyle Isom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KI_StockDelta : NSObject
{
    double buyPrice, sellPrice;
    int shares;
    double yield, gain;                 // yield is % return: yield + 1 * 100 to store
                                        //                    yield /= 100 - 1 for calculations
}

@property double buyPrice, sellPrice;
@property int shares;
@property double yield, gain;

- (void) calcYieldAndGainFromDelta;     // updates yield and gain
- (void) calcSellFromYield;             // updates sellPrice and gain
- (void) calcSellFromGain;              // updates sellPrice and yield


@end
