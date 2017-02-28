//
//  Dot.h
//  TouchPainterDemo
//
//  Created by OnlyStu on 2017/2/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex

{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (strong , nonatomic) UIColor * color;
@property (assign , nonatomic) CGFloat size;

- (id)copyWithZone:(NSZone *)zone;

@end
