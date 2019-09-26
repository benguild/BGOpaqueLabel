//
//  ViewController.m
//  BGOpaqueLabelExample
//
//  Created by Ben Guild on 9/25/19.
//  Copyright © 2019 Ben Guild. All rights reserved.
//

#import "ViewController.h"

#import "BGOpaqueLabel.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;

@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        self.label1 = [[BGOpaqueLabel alloc] init];
        self.label1.layer.backgroundColor = UIColor.greenColor.CGColor;
        self.label1.text = @"Hello. 🤷🏼‍♂️";
        self.label1.textAlignment = NSTextAlignmentCenter;

        [self.view addSubview:self.label1];

        self.label2 = [[BGOpaqueLabel alloc] init];
        self.label2.backgroundColor = UIColor.greenColor;
        self.label2.layer.backgroundColor = UIColor.greenColor.CGColor;
        self.label2.text = @"Hello.";
        self.label2.textAlignment = NSTextAlignmentCenter;

        [self.view addSubview:self.label2];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, 1.23f * NSEC_PER_SEC),
        dispatch_get_main_queue(),
        ^{
            self.label1.text = @"Goodbye. 😮";
            self.label2.text = @"Goodbye.";
        }
    );
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    CGRect label1Frame = CGRectNull;
    CGRect label2Frame = CGRectNull;

    CGRectDivide(
        self.view.bounds,
        &label1Frame,
        &label2Frame,
        floorf(self.view.bounds.size.height / 2.f),
        CGRectMinYEdge
    );

    self.label1.frame = label1Frame;
    self.label2.frame = label2Frame;
}

@end
