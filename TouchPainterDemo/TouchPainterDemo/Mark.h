//
//  Mark.h
//  TouchPainterDemo
//
//  Created by OnlyStu on 2017/2/28.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Mark <NSObject>

@property (strong , nonatomic) UIColor *color;
@property (assign , nonatomic) CGFloat size;
@property (assign , nonatomic) CGPoint location;
@property (assign , nonatomic , readonly) NSUInteger count;
@property (copy , nonatomic , readonly) id <Mark> lastChild;

- (id) copy;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

@end
