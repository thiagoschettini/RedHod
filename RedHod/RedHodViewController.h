//
//  RedHodViewController.h
//  RedHod
//
//  Created by Thiago Silva on 8/17/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RedHodViewController : UIViewController 
        <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    UIButton *playButton;
    UIButton *recordButton;
    UIButton *recordButton2;
    UIButton *stopButton;
}

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton2;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
-(IBAction)recordAudio;
-(IBAction)playAudio;
-(IBAction)stop;

@end
