//
//  ViewController.m
//  TableView
//
//  Created by Hooriya Anam on 29/08/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)RecordAgain:(id)sender {
    
}

- (void)viewDidLoad
{
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iphone5_intro_converted.png"]];
        
        backgroundView.contentMode = UIViewContentModeScaleAspectFit;
    
        backgroundView.clipsToBounds = YES;
    
        [self.view addSubview:backgroundView];
        [super viewDidLoad];
        
       //backgroundView.contentMode = UIViewContentModeScaleAspectFit;
    //backgroundView.clipsToBounds = YES;
   [self.view bringSubviewToFront:_RecordVideo];
    [self.view bringSubviewToFront:_RecordLabel];
     [self.view bringSubviewToFront:_Gallery];
    [self.view bringSubviewToFront:_GalleryLabel];
     [self.view bringSubviewToFront:_Projects];
    [self.view bringSubviewToFront:_ProjectLabel];
    [self.view bringSubviewToFront:_RecordAgain];
       }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Gallery:(id)sender {
}
- (IBAction)Projects:(id)sender {
}

- (IBAction)RecordVideo:(id)sender {
    
}



@end
