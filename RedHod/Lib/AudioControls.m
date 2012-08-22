//
//  AudioControls.m
//  RedHod
//
//  Created by Thiago Silva on 8/22/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import "AudioControls.h"
#import "RedHodAppDelegate.h"

@implementation AudioControls

@synthesize recordButton, playButton, stopButton;

-(void)drawControlButtons{
    UIImage *recordImage = [UIImage imageNamed:@"rec.png"];
    recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    recordButton.frame = CGRectMake(30, 200, 100, 37);
    [recordButton setBackgroundImage:recordImage forState:UIControlStateNormal];
    [self.view addSubview:recordButton];
    //[[[UIApplication sharedApplication] keyWindow] addSubview:recordButton];
    //[recordButton setHidden:YES];
    
    UIImage *playImage = [UIImage imageNamed:@"play.png"];
    playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(200, 200, 100, 37);
    [playButton setBackgroundImage:playImage forState:UIControlStateNormal];
    [self.view addSubview:playButton];
    //[[[UIApplication sharedApplication] keyWindow] addSubview:playButton];
    //[playButton setHidden:YES];
    
    UIImage *stopImage = [UIImage imageNamed:@"stop.png"];
    stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.frame = CGRectMake(350, 200, 100, 37);
    [stopButton setBackgroundImage:stopImage forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    //[[[UIApplication sharedApplication] keyWindow] addSubview:stopButton];
    //[stopButton setHidden:YES];
}

-(void)resetButtons{
    for(UIView *subview in [self.view subviews]){
        if(subview == self.recordButton || subview == self.playButton || subview == self.stopButton){
            [subview removeFromSuperview];
        }
    }
}

-(void)recordAudio{
    stopButton.enabled = YES;
    playButton.enabled = NO;
    recordButton.enabled = NO;
    
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:fileName];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary 
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16], 
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2], 
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0], 
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSettings error:&error];
    
    if(error){
        NSLog(@"error: %@", [error localizedDescription]);
    }else{
        [audioRecorder prepareToRecord];
    }    
    
    if(!audioRecorder.recording){
        playButton.enabled = NO;
        stopButton.enabled = YES;
        [audioRecorder record];
    }
    NSLog(@"url arquivo audio: %@", audioRecorder.url);
}

-(void)stop{
    //[playButton setHidden: NO];
    stopButton.enabled = NO;
    playButton.enabled = YES;
    recordButton.enabled = YES;
    
    if(audioRecorder.recording){
        [audioRecorder stop];
    }else if(audioPlayer.playing){
        [audioPlayer stop];
    }
}

-(void)playAudio{
    stopButton.enabled = YES;
    playButton.enabled = NO;
    recordButton.enabled = NO;
    
    NSArray *dirPaths;
    NSString *docsDir;
    NSError *error;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:fileName];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    [audioPlayer play];
    NSLog(@"%@", fileName);
}

@end
