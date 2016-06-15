//
//  PageViewController.m
//  Page view and Demo
//
//  Created by Jaswanth Jeenu on 31/05/16.
//  Copyright © 2016 Jaswanth Jeenu. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
    
    [self.navigationItem.rightBarButtonItem setTitle:@"Login"];
    
    arrImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    contentViewController.imageFilename = arrImages[0];
    
    [self setViewControllers:@[contentViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSLog(@"viewControllerBeforeViewController %d", pageIndex);
    
    if(pageIndex > 0) {
        pageIndex--;
        PageContentViewController *vcToReturn = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
        //vcToReturn.imageView.image = [UIImage imageNamed:arrImages[pageIndex]];
        vcToReturn.imageFilename = arrImages[pageIndex];
    
        return vcToReturn;
    }
    else return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSLog(@"viewControllerAfterViewController: %d", pageIndex);
    if(pageIndex < [arrImages count] - 1) {
        pageIndex++;
        PageContentViewController *vcToReturn = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
        //vcToReturn.imageView.image = [UIImage imageNamed:arrImages[pageIndex]];
        vcToReturn.imageFilename = arrImages[pageIndex];
        return vcToReturn;
    }
    else  return nil;
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return arrImages.count;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    NSLog(@"presentationIndexForPageViewController");
    return 0;
}


-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    pageIndex = (int)[arrImages indexOfObject:((PageContentViewController *) pendingViewControllers[0]).imageFilename];
    NSLog(@"Page index in will transition: %d", pageIndex);
}

- (IBAction)btnLoginClicked:(id)sender {
    NSLog(@"btn Login Clicked");
    [self performSegueWithIdentifier:@"showLoginScreenSegue" sender:nil];
}
@end