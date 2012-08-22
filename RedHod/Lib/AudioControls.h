//
//  AudioControls.h
//  RedHod
//
//  Created by Thiago Silva on 8/22/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NSString *fileName;

@interface AudioControls : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>
{
    AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;
    UIButton *playButton;
    UIButton *recordButton;
    UIButton *stopButton;
}

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;

-(IBAction)recordAudio;
-(IBAction)playAudio;
-(IBAction)stop;
-(IBAction)drawControlButtons;
-(IBAction)resetButtons;

@end
