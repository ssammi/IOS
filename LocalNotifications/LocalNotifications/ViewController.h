//
//  ViewController.h
//  LocalNotifications
//
//  Created by Yuanming Zhou on 6/4/16.
//  Copyright © 2016 Yuanming Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *message;

- (IBAction)start:(id)sender;

- (IBAction)Stop:(id)sender;

@end

