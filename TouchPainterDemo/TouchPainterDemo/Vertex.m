//
//  Vertex.m
//  TouchPainterDemo
//
//  Created by OnlyStu on 2017/2/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex
@synthesize location = location_;
@dynamic color,size;

- (id)initWithLocation:(CGPoint)location
{
    if (self = [super init]) {
        
        [self setLocation:location];
    }
    return self;
}

- (void)setColor:(UIColor *)color {}
- (UIColor *)color {return  nil;}
- (void)setSize:(CGFloat)size {}
- (CGFloat)size {return  0.0;}

- (void)addMark:(id<Mark>)mark {}
- (void)removeMark:(id<Mark>)mark {}
- (id<Mark>)childMarkAtIndex:(NSUInteger)index {return nil;}
- (id<Mark>)lastChild{return  nil;}
- (NSUInteger)count {return 0;}
- (NSEnumerator *)enumerator {return  nil;}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

@end
