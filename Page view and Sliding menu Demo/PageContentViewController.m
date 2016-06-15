//
//  PageContentViewController.m
//  Page view and Demo
//
//  Created by Jaswanth Jeenu on 30/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

-(void)viewDidLoad {
    NSLog(@"The file name is %@",self.imageFilename);
    self.imageView.image = [UIImage imageNamed:self.imageFilename];
    
}

@end