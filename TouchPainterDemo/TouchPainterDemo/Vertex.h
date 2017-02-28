//
//  Vertex.h
//  TouchPainterDemo
//
//  Created by OnlyStu on 2017/2/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Vertex : NSObject <Mark, NSCopying>
{
    @protected
    CGPoint location_;
}

@property (strong , nonatomic) UIColor *color;
@property (assign , nonatomic) CGFloat size;
@property (assign , nonatomic) CGPoint location;
@property (assign , nonatomic , readonly) NSUInteger count;
@property (copy , nonatomic , readonly) id <Mark> lastChild;

- (id) initWithLocation:(CGPoint) location;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

- (id)copyWithZone:(NSZone *)zone;

@end
