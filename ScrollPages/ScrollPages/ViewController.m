//
//  ViewController.m
//  ScrollPages
//
//  Created by Carlos Alcala on 3/19/15.
//  Copyright (c) 2015 Stellar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.items = [NSMutableArray new];
    
    [self.scrollView layoutIfNeeded];
    
    for (int i=1; i<=3; i++) {
        [self.items addObject:[NSString stringWithFormat:@"image%d", i]];
    }
    
    CGRect frame = self.view.bounds;
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    CGFloat contentWidth = width * [self.items count];
    
    [self.scrollView setContentSize:CGSizeMake(contentWidth, height)];
    
    
    for (int i=0; i<[self.items count]; i++) {
        
        CGRect viewFrame = frame;
        
        viewFrame.origin.x = i * width;
        
        UIView *pageView = [[UIView alloc] initWithFrame:viewFrame];
        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height/2 - 30, frame.size.width, 30)];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.text = [self.items objectAtIndex:i];
//        label.textColor = [UIColor blackColor];
//        [pageView addSubview:label];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(pageView.frame.size.width/2 -320/2, pageView.frame.size.height/2 -320/2, 320, 320)];
//        image.center = pageView.center;
        
        image.image = [UIImage imageNamed:[self.items objectAtIndex:i]];
        
        NSLog(@"IMAGE: %@", [self.items objectAtIndex:i]);
        
        [pageView addSubview:image];
        [self.scrollView addSubview:pageView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
