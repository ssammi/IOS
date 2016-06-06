//
//  ViewController.m
//  LocalNotifications
//
//  Created by Yuanming Zhou on 6/4/16.
//  Copyright © 2016 Yuanming Zhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController(){
    NSUserDefaults *defaults;//this will keep track as to whether the notification is on or off }
}

@end

@implementation ViewController
@synthesize message;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //This initializes the UIUserNotifcations
    defaults = [NSUserDefaults standardUserDefaults];
    UIUserNotificationType types = UIUserNotificationTypeBadge| UIUserNotificationTypeSound| UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    [defaults setBool:YES forKey:@"notificationIsActive"];
    [defaults synchronize];//"Notifications Started";
    NSTimeInterval interval;
    interval = 60* 60* 12;//12 hours from now
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0]; //Enter the time here in seconds.
    localNotification.alertBody= @"This is test notification message";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.repeatInterval= NSCalendarUnitMinute;//NSCalendarUnitMinute; //Repeating instructions here.
    localNotification.soundName= UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (IBAction)Stop:(id)sender {
    self.message.text=@"Notifications Stopped";
    [defaults setBool:NO forKey:@"notificationIsActive"];
    [defaults synchronize];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    BOOL notificationIsActive = [defaults boolForKey:@"notificationIsActive"];
    if (notificationIsActive == true) {
        self.message.text=@"Notification is Active";
    }
}
@end
