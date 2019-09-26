//
//  BGOpaqueLabel.m
//  BGOpaqueLabel
//
//  Created by Ben Guild on 4/29/19.
//  Copyright © 2019 Ben Guild. All rights reserved.
//

#import "BGOpaqueLabel.h"

static void * const BGOpaqueLabelKVOContext = (void *)&BGOpaqueLabelKVOContext;

@implementation BGOpaqueLabel

- (void)dealloc {
    [self.layer removeObserver:self forKeyPath:NSStringFromSelector(@selector(backgroundColor))];
    [self.layer removeObserver:self forKeyPath:NSStringFromSelector(@selector(sublayers))];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.layer addObserver:self
                     forKeyPath:NSStringFromSelector(@selector(backgroundColor))
                        options:(NSKeyValueObservingOptionInitial |
                                 NSKeyValueObservingOptionNew)
                        context:BGOpaqueLabelKVOContext];
        [self.layer addObserver:self
                     forKeyPath:NSStringFromSelector(@selector(sublayers))
                        options:(NSKeyValueObservingOptionInitial |
                                 NSKeyValueObservingOptionNew)
                        context:BGOpaqueLabelKVOContext];
    }

    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    if (self.layer.backgroundColor != nil) {
        CGContextSetFillColorWithColor(ctx, self.layer.backgroundColor);
        CGContextFillRect(ctx, CGContextGetClipBoundingBox(ctx));
    }

    [super drawLayer:layer inContext:ctx];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if (context == BGOpaqueLabelKVOContext) {
        if (object == self.layer) {
            if ([keyPath isEqualToString:NSStringFromSelector(@selector(backgroundColor))] ||
                [keyPath isEqualToString:NSStringFromSelector(@selector(sublayers))]) {
                BOOL opaque = (self.layer.backgroundColor != nil);

                for (CALayer *layer in self.layer.sublayers) {
                    if (layer.opaque != opaque) {
                        layer.opaque = opaque;

                        [layer setNeedsDisplay];
                    }
                }

                return;
            }
        }
    }

    [super observeValueForKeyPath:keyPath
                         ofObject:object
                           change:change
                          context:context];
}

@end
