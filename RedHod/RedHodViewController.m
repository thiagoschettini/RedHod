//
//  RedHodViewController.m
//  RedHod
//
//  Created by Thiago Silva on 8/17/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import "RedHodViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation RedHodViewController

@synthesize recordButton, recordButton2, playButton, stopButton;

-(void)recordAudio:(UIButton *)sender {
    NSArray *dirPaths;
    NSString *docsDir;
    NSString *filename;
    
    if (sender.tag == 1){
        filename = @"audioForScene1.caf";
    }else if(sender.tag == 2){
        filename = @"audioForScene2.caf";
    }
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:filename];
    
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
    stopButton.enabled = NO;
    playButton.enabled = YES;
    recordButton.enabled = YES;
    
    if(audioRecorder.recording){
        [audioRecorder stop];
    }else if(audioPlayer.playing){
        [audioPlayer stop];
    }
}

/*-(void)playAudio{
    if(!audioRecorder.recording){
        stopButton.enabled = YES;
        recordButton.enabled = NO;
        
        NSError *error;
        
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioRecorder.url error:&error];
        
        audioPlayer.delegate = self;
        
        if(error){
            NSLog(@"error: %@", [error localizedDescription]);
        }else{
            [audioPlayer play];
        }
    }
}*/

-(void)playAudio{
    NSArray *dirPaths;
    NSString *docsDir;
    NSError *error;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:@"sound.caf"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    [audioPlayer play];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    recordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    recordButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    playButton.frame = CGRectMake(100, 170, 100, 30);
    //set the button's title
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    //add the button to the view
    [self.view addSubview:playButton];
    
    stopButton.frame = CGRectMake(100, 210, 100, 30);
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    
    recordButton.frame = CGRectMake(100, 250, 100, 30);
    [recordButton setTitle:@"Record" forState:UIControlStateNormal];
    recordButton.tag = 1;
    [self.view addSubview:recordButton];
    
    recordButton2.frame = CGRectMake(100, 290, 100, 30);
    [recordButton2 setTitle:@"Record Scene 2" forState:UIControlStateNormal];
    recordButton2.tag = 2;
    [self.view addSubview:recordButton2];
    
    //playButton.enabled = NO;
    //stopButton.enabled = NO;
    
    
    //LISTEN FOR CLICKS
    [playButton addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [recordButton addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [recordButton2 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
