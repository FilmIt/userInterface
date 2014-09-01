//
//  extra.h
//  TableView
//
//  Created by Hooriya Anam on 01/09/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"


@interface extra : ViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *records;

@end