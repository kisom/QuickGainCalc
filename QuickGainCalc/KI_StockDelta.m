//
//  KI_StockDelta.m
//  QuickGainCalc
//
//  Created by Kyle Isom on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "KI_StockDelta.h"

@implementation KI_StockDelta
@synthesize buyPrice, sellPrice, shares, yield, gain;

- (id)init
{
    self = [super init];
    if (self) {
        // set to default sane values that won't explode
        [self setBuyPrice:1.0];
        [self setSellPrice:1.0];
        [self setShares:1];
        
        [self setYield:1.0];
        [self setGain:0.0];
    }
    
    return self;
}

- (void) calcYieldAndGainFromDelta
{
    double tempGain  = 0.0;
    double tempYield = 0.0;
    
    tempGain  = shares * ([self sellPrice] - [self buyPrice]);
    tempYield = ([self sellPrice] / [self buyPrice]);
    tempYield++;
    tempYield *= 100;
    
    [self setGain:tempGain];
    [self setYield:tempYield];
    
    return;
}

- (void) calcSellFromYield
{
    double tempSellPrice = 0;
    double tempGain = 0;
    double tempYield = [self yield] / 100.0 - 1;
    
    tempSellPrice = [self buyPrice] * (1 + tempYield);
    tempGain = shares * (tempSellPrice - [self buyPrice]);
    [self setSellPrice:tempSellPrice];
    [self setGain:tempGain];
    
    return;
}

- (void) calcSellFromGain
{
    double pricePerShare = [self gain] / (double) [self shares];
    [self setSellPrice:([self buyPrice] + pricePerShare)];
    
    double tempYield = [self sellPrice] / [self buyPrice];
    // massage the value into what we want
    tempYield -= 1;    
    tempYield *= 100;
    
    [self setYield:tempYield];
    
    return;
}

@end
