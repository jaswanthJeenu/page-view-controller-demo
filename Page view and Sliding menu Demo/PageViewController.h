//
//  PageViewController.h
//  Page view and Demo
//
//  Created by Jaswanth Jeenu on 31/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface PageViewController : UIPageViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    NSArray *arrImages, *arrVCs;
    PageContentViewController *contentViewController;
    int pageIndex;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnLogin;
- (IBAction)btnLoginClicked:(id)sender;



@end
