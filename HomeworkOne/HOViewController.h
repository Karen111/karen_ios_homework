//
//  HOViewController.h
//  HomeworkOne
//
//  Created by Karen on 2014/8/13.
//  Copyright (c) 2014年 livebricks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HOViewController : UIViewController<UIScrollViewDelegate>



@property (weak, nonatomic) IBOutlet UIScrollView *introScroll;
@property (weak, nonatomic) IBOutlet UIImageView *introImage;
@property (weak, nonatomic) IBOutlet UITextView *introText;
@property (weak, nonatomic) IBOutlet UIPageControl *introPageControl;

@end
