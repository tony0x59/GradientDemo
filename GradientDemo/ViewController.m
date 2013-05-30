//
//  ViewController.m
//  GradientDemo
//
//  Created by Tony Kong on 13-5-26.
//  Copyright (c) 2013年 Tony Kong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    GradientView *testView = [[GradientView alloc] initWithFrame:CGRectMake(10, 10, 200, 300)];
    [self.view addSubview:testView];
    [testView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
