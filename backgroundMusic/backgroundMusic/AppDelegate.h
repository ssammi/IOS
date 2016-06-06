//
//  AppDelegate.h
//  backgroundMusic
//
//  Created by Yuanming Zhou on 6/4/16.
//  Copyright © 2016 Yuanming Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    AVAudioPlayer *audioPlayer;
    
}

@property (strong, nonatomic) UIWindow *window;


@end

