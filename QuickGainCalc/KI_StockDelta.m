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
    
    [self setGain:tempGain];
    [self setYield:tempYield];
    
    return;
}

- (void) calcSellFromYield
{
    double tempSellPrice = 0;
    double tempGain = 0;
    
    tempSellPrice = [self buyPrice] * [self yield];
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
    
    [self setYield:tempYield];
    
    return;
}

- (void) convertYieldForStorage:(NSString *)textYield
{
    char *yieldBuffer = malloc(16);
    [textYield getCString:yieldBuffer maxLength:15 encoding:NSUTF8StringEncoding];
    double tempYield  = atof(yieldBuffer);
    
    tempYield /= 100;
    tempYield++;
    [self setYield:tempYield];
    
    free(yieldBuffer);
    yieldBuffer = NULL;
    
}

- (NSString *) convertYieldForDisplay
{
    double tempYield = [self yield];
    tempYield--;
    tempYield *= 100;
    
    return [NSString stringWithFormat:@"%0.3f%%", tempYield];
}

@end
