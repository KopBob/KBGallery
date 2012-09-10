//
//  KBGalleryViewController.m
//  KBGallery
//
//  Created by Kopin Boris on 10.09.12.
//  Copyright (c) 2012 Boris Kopin. All rights reserved.
//

#import "KBGalleryViewController.h"

@interface KBGalleryViewController () {
    NSMutableArray *fotos_view_arr;
    NSMutableArray *thumbs_view_arr;
}

@property (nonatomic,strong) UIActivityIndicatorView *act;

@end

@implementation KBGalleryViewController
@synthesize fotoGallery;
@synthesize thumbsGallery;
@synthesize fotoPageControl;
@synthesize act;

@synthesize fotos_arr;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        fotos_view_arr = [[NSMutableArray alloc] initWithCapacity:8];
        thumbs_view_arr = [[NSMutableArray alloc] initWithCapacity:8];
        
        
        self.fotos_arr = [[NSMutableArray alloc] initWithObjects:
                          @"http://cs411029.userapi.com/v411029554/4f36/5PMbyN3AguI.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f3d/uK2BwS8Ch6g.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f44/1L7AS6jtC7w.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f4b/kokt7Q5fbNk.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f52/9cAIy-TF9ko.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f52/9cAIy-TF9ko.jpg",
                          @"http://cs411029.userapi.com/v411029554/4f59/8FWzF1T3F-Q.jpg",nil];
    }
    return self;
}

- (void) setupTestViews {
    
    int images_number = 7;
    
    self.fotoGallery.contentSize        = CGSizeMake(320*images_number, self.fotoGallery.bounds.size.height);
    self.thumbsGallery.contentSize      = CGSizeMake(80*images_number, self.thumbsGallery.bounds.size.height);
    self.fotoPageControl.numberOfPages  = images_number;
    
    CGRect foto_rect = CGRectMake(0, 0, 320, 400);
    CGRect thumb_rect = CGRectMake(0, 0, 80, 60);
    
    
    
    for (int i = 0; i < images_number; i++) {
        
        //Setup FotoGallery
        //_________________________________________________________________________________________________________
        
        //Setup foto_view
        //*****************************************************************************************************
        UIView *foto_view                   = [[UIView alloc]
                                               initWithFrame:CGRectMake(foto_rect.size.width * i,
                                                                     foto_rect.origin.y,
                                                                     foto_rect.size.width,
                                                                     foto_rect.size.height)];
        
        UITapGestureRecognizer *foto_tap_gesture = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(foto_tapped:)];
        [foto_view addGestureRecognizer:foto_tap_gesture];
        
        
        //Setup foto_image_view
        //*****************************************************************************************************
        UIImageView *foto_image_view        = [[UIImageView alloc]
                                               initWithFrame:CGRectMake(0,
                                                                    foto_rect.origin.y,
                                                                    foto_rect.size.width,
                                                                    foto_rect.size.height)];
        foto_image_view.userInteractionEnabled    = YES;
        
        //Setup foto_image_view
        //*****************************************************************************************************
        UIActivityIndicatorView *foto_acivity_view = [[UIActivityIndicatorView alloc]
                                                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        foto_acivity_view.center = CGPointMake(160, 200);
        [foto_acivity_view startAnimating];

        //Add View to foto_view
        [foto_view addSubview:foto_image_view];
        [foto_view addSubview:foto_acivity_view];
        
        
        
        //Setup ThumbGallery
        //_________________________________________________________________________________________________________
        //Setup thumb_view
        //*****************************************************************************************************
        
        UIView *thumb_view             = [[UIView alloc]
                                               initWithFrame:CGRectMake(thumb_rect.size.width * i,
                                                                        thumb_rect.origin.y,
                                                                        thumb_rect.size.width,
                                                                        thumb_rect.size.height)];
        
        UITapGestureRecognizer *thumb_tap_gesture = [[UITapGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(thumb_tapped:)];
        [thumb_view addGestureRecognizer:thumb_tap_gesture];

        //Setup thumb_image_view
        //*****************************************************************************************************
        UIImageView *thumb_image_view             = [[UIImageView alloc]
                                               initWithFrame:CGRectMake(0,
                                                                       thumb_rect.origin.y,
                                                                       thumb_rect.size.width,
                                                                       thumb_rect.size.height)];
        thumb_image_view.userInteractionEnabled   = YES;

        //Setup foto_image_view
        //*****************************************************************************************************
        UIActivityIndicatorView *thumb_acivity_view = [[UIActivityIndicatorView alloc]
                                                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        thumb_acivity_view.center = CGPointMake(40, 30);
        [thumb_acivity_view startAnimating];
        //Add View to thumb_view
        [thumb_view addSubview:thumb_image_view];
        [thumb_view addSubview:thumb_acivity_view];
        
        
        
        if (i % 2 == 0) {
            foto_view.backgroundColor   = [UIColor blackColor];
            thumb_view.backgroundColor  = [UIColor blackColor];
        } else {
            foto_view.backgroundColor   = [UIColor greenColor];
            thumb_view.backgroundColor  = [UIColor greenColor];
        }
        
        [fotos_view_arr addObject:foto_view];
        [thumbs_view_arr addObject:thumb_view];
        
        [self.fotoGallery addSubview:foto_view];
        [self.thumbsGallery addSubview:thumb_view];
                
    }
    
}

- (void)foto_tapped:(UITapGestureRecognizer *) gesture{
    int foto_number = gesture.view.frame.origin.x / 320;

}

- (void)thumb_tapped:(UITapGestureRecognizer *) gesture{
    int thumb_number = gesture.view.frame.origin.x / 80;
    
    [self.fotoGallery scrollRectToVisible:((UIImageView *)[fotos_view_arr objectAtIndex:thumb_number]).frame
                                 animated:YES];
}

- (void) loadView {
    [super loadView];
    
    
    
    
    //Setup fotoGallery
    self.fotoGallery.delegate                       = self;
    self.fotoGallery.bounces                        = YES;
    self.fotoGallery.pagingEnabled                  = YES;
//    self.fotoGallery.showsHorizontalScrollIndicator = NO;
    
    self.fotoGallery.contentSize                    = CGSizeMake(320*3, self.fotoGallery.bounds.size.height);

    //Setup Page Control
    
    self.fotoPageControl.numberOfPages              = 3;
    self.fotoPageControl.currentPage                = 0;
    
    //Setup thumbsGallery
    self.thumbsGallery.delegate                       = self;
    self.thumbsGallery.bounces                        = YES;
    self.thumbsGallery.pagingEnabled                  = YES;
//    self.thumbsGallery.showsHorizontalScrollIndicator = NO;
    
    self.thumbsGallery.contentSize                    = CGSizeMake(320*3, self.thumbsGallery.bounds.size.height);
    
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 30, 30)];
    test.backgroundColor = [UIColor redColor];
    [self.fotoGallery addSubview:test];
    
    [self setupTestViews];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [act startAnimating];

    [self.view addSubview:act];
    
}

- (void)displayImage:(UIImage *)image {
    NSLog(@"Image is loaded!");
    UIImageView *test = [[UIImageView alloc] initWithImage:image];
    test.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:test];
    [act stopAnimating];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://cs411029.userapi.com/v411029554/4f3d/uK2BwS8Ch6g.jpg"]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    
    [self performSelectorOnMainThread:@selector(displayImage:) withObject:image waitUntilDone:NO];
    
}

- (void)viewDidUnload
{
    [self setFotoGallery:nil];
    [self setThumbsGallery:nil];
    [self setFotoPageControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    if (sender == self.fotoGallery) {
        CGFloat pageWidth = sender.frame.size.width;
        int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        self.fotoPageControl.currentPage = page;
    }
}


- (void) scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndScrollingAnimation");
}


@end
