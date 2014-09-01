//
//  SecondViewController.h
//  TableView
//
//  Created by Hooriya Anam on 01/09/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"


@interface SecondViewController : ViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

@property (weak, nonatomic) IBOutlet UIButton *captureVideo;


@end
