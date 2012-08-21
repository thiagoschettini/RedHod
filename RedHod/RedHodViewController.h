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
    UIButton *stopButton;
    
    UIButton *chap01;
    UIButton *chap02;
    UIButton *chap03;
    UIButton *chap04;
    UIButton *chap05;
    UIButton *chap06;
    UIButton *chap07;
    UIButton *chap08;
    UIButton *chap09;
    UIImageView *currentChapter;
    
    IBOutlet UIScrollView *textToRead;
    UIImageView *textImage;
}

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;

@property (nonatomic, retain) IBOutlet UIButton *chap01;
@property (nonatomic, retain) IBOutlet UIButton *chap02;
@property (nonatomic, retain) IBOutlet UIButton *chap03;
@property (nonatomic, retain) IBOutlet UIButton *chap04;
@property (nonatomic, retain) IBOutlet UIButton *chap05;
@property (nonatomic, retain) IBOutlet UIButton *chap06;
@property (nonatomic, retain) IBOutlet UIButton *chap07;
@property (nonatomic, retain) IBOutlet UIButton *chap08;
@property (nonatomic, retain) IBOutlet UIButton *chap09;
@property (nonatomic, retain) UIImageView *currentChapter;

@property (nonatomic, retain) UIView *textToRead;
@property (nonatomic, retain) UIImageView *textImage;

-(IBAction)recordAudio;
-(IBAction)playAudio;
-(IBAction)stop;

@end
