//
//  ViewController.h
//  TableView
//
//  Created by Hooriya Anam on 29/08/2014.
//  Copyright (c) 2014 sophrosyne. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *RecordVideo;
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIButton *Gallery;
@property (weak, nonatomic) IBOutlet UIButton *Projects;

@property (weak, nonatomic) IBOutlet UILabel *RecordLabel;
@property (weak, nonatomic) IBOutlet UILabel *GalleryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ProjectLabel;
@property (weak, nonatomic) IBOutlet UIButton *RecordAgain;

@end

