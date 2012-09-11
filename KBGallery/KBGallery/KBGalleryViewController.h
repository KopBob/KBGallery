//
//  KBGalleryViewController.h
//  KBGallery
//
//  Created by Kopin Boris on 10.09.12.
//  Copyright (c) 2012 Boris Kopin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface KBGalleryViewController : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *fotoGallery;
@property (weak, nonatomic) IBOutlet UIScrollView *thumbsGallery;
@property (weak, nonatomic) IBOutlet UIPageControl *fotoPageControl;
@property (strong, nonatomic) NSMutableArray *fotos_arr;

- (void)foto_tapped:(UITapGestureRecognizer *) gesture;
- (void)thumb_tapped:(UITapGestureRecognizer *) gesture;


@end
