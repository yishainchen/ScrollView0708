//
//  ViewController.m
//  ScrollView0708
//
//  Created by yishain on 7/9/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollsToTop = YES;
    pageCount = 10;
    pageDic = [[NSMutableDictionary alloc] init];
    self.testScrollView.contentSize = CGSizeMake(320*pageCount, [UIScreen mainScreen].bounds.size.height - 20);
    self.testScrollView.pagingEnabled = YES;
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    }
- (void)loadScrollViewWithPage:(int)page {
    if (page < 0 || page >= pageCount) return;
    else if(pageDic[@(page)] == nil) {
        NSLog(@"add page %d", page);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*page, 0, 320, [UIScreen mainScreen].bounds.size.height - 20)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        NSString *name = [NSString stringWithFormat:@"Venice%d.png", page] ;
        imageView.image = [UIImage imageNamed:name];
        [self.testScrollView addSubview:imageView];
        pageDic[@(page)] = imageView;
  
       self.pageCtl.currentPage = page - 1;
        
        
//        NSString *filename = [pageDic[@(page)]  objectAtIndex:self.pageCtl.currentPage];
//       
        
        }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView { 
    return imageView; }


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    [self removeScrollViewWithPage:page - 2];
    [self removeScrollViewWithPage:page + 2]; }

-(void)removeScrollViewWithPage:(int)page {
    if (page < 0 || page >= pageCount) return;
    else if(pageDic[@(page)]) {
        NSLog(@"remove page %d", page);
        [pageDic[@(page)] removeFromSuperview];
        [pageDic removeObjectForKey:@(page)];
         }}

//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.testScrollView setContentOffset:CGPointMake(320, 220)
//                                 animated:YES]; }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
