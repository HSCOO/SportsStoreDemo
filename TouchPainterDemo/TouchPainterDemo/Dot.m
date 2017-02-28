//
//  Dot.m
//  TouchPainterDemo
//
//  Created by OnlyStu on 2017/2/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize size = size_,color = color_;

- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    //复制Color和Size
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [dotCopy setSize:size_];
    
    return dotCopy;
}

@end
