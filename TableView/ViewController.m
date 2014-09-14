//
//  ViewController.m
//  TableView
//
//  Created by Hooriya Anam on 29/08/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad
{
    
//if ([UIScreen mainScreen].bounds.size.height == 568)
     UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"film.png"]];
        
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
    
    AVAsset *videoThumbnail = [AVAsset assetWithURL:_videoURL];
    
    [AVAssetImageGenerator assetImageGeneratorWithAsset:videoThumbnail];
    
    

    
       }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Gallery:(id)sender {
   
        UIImagePickerController *mediaLibrary = [[UIImagePickerController alloc] init];
        mediaLibrary.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        mediaLibrary.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        mediaLibrary.allowsEditing = NO;
        [self presentViewController:mediaLibrary animated:YES completion:NO];
    
    
    
    
    
}
- (IBAction)Projects:(id)sender {
}

- (IBAction)RecordVideo:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate =self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.videoMaximumDuration=15;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.videoURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
    [self.view addSubview:self.videoController.view];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoPlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.videoController];
    [self.videoController play];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)videoPlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Stop the video player and remove it from view
    [self.videoController stop];
    [self.videoController.view removeFromSuperview];
    self.videoController = nil;
    
    // Display a message
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Video Playback" message:@"Just finished the video playback. The video is now removed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}



- (UIImage*)loadImage {
    
   
 //2nd method
/* AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:self.urlForConevW options:nil];
 AVAssetImageGenerator *generateImg = [[AVAssetImageGenerator alloc] initWithAsset:asset];
 NSError *error = NULL;
 CMTime time = CMTimeMake(1, 65);
 CGImageRef refImg = [generateImg copyCGImageAtTime:time actualTime:NULL error:&error];
 NSLog(@"error==%@, Refimage==%@", error, refImg);
 
 UIImage *FrameImage= [[UIImage alloc] initWithCGImage:refImg];
*/
    
 //actual method
    
   AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:_videoURL options:nil];
    AVAssetImageGenerator *generate = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    NSError *err = NULL;
    generate.appliesPreferredTrackTransform = YES;
  //  Float64 durationSeconds =CMTimeGetSeconds([asset duration]);
    CMTime time = CMTimeMakeWithSeconds(1, 2);
    
    CGImageRef imgRef = [generate copyCGImageAtTime:time actualTime:NULL error:&err];
     UIImage *one = [[UIImage alloc] initWithCGImage:imgRef];
  //  [_firstImage setImage:one];
  //  _firstImage.contentMode = UIViewContentModeScaleAspectFit;
   
     
 
   // return [[UIImage alloc] initWithCGImage:imgRef];
    return one;
    
}

/*
-(UIImage *)generateThumbImage : (NSString *)filepath
{
    NSURL *url = [NSURL fileURLWithPath:filepath];
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc]initWithAsset:asset];
    CMTime time = [asset duration];
    time.value = 6000;
    CGImageRef imageRef = [imageGenerator copyCGImageAtTime:time actualTime:NULL error:NULL];
    UIImage *thumbnail = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);  // CGImageRef won't be released by ARC
    
    return thumbnail;
}
 */



@end
