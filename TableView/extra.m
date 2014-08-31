//
//  extra.m
//  TableView
//
//  Created by Hooriya Anam on 31/08/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//

#import "extra.h"
@implementation extra


- (IBAction)records:(id)sender {
    UIImagePickerController *videoScreen = [[UIImagePickerController alloc] init];
    videoScreen.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays movie capture control
    videoScreen.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    
    videoScreen.allowsEditing = NO;
    videoScreen.delegate = self;
    
    [self presentViewController:videoScreen animated: YES completion:NO];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:NO completion:NO];
    // Handle a movie capture
    if (CFStringCompare ((__bridge_retained CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        NSURL *movieURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSString *moviePath= movieURL.absoluteString;
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum(moviePath, self, nil, nil);
        }
    }
}




@end
