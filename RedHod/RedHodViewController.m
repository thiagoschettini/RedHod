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

@synthesize chap01, chap02, chap03, chap04, chap05, chap06, chap07, chap08, chap09, currentChapter;

-(void)recordAudio:(UIButton *)sender {
    [playButton setHidden: YES];
    
    NSArray *dirPaths;
    NSString *docsDir;
    NSString *filename;
    
    [currentChapter setImage:nil];
    
    if (sender.tag == 1){
        filename = @"audioForScene1.caf";
        
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(130, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        
        textView.editable = NO;
        //myTextView.userInteractionEnabled = NO;
        textView.text = @"Um dia sua Mãe lhe chamou e lhe disse: \
        - Chapeuzinho, leve este pedaço de bolo e essa garrafa de vinho para sua avó. \
        Ela está doente e fraca, e isto vai fazê-la ficar melhor. Comporte-se no caminho, e de modo algum saia da \estrada, ou você pode cair e quebrar a garrafa de vinho e ele é muito importante para a recuperação de sua avó. \
        Chapeuzinho prometeu que obedeceria a sua mãe e pegando a cesta com o bolo e o vinho, despediu-se e partiu. Sua avó morava no meio da floresta, distante uma hora e meia da vila. ";
        //some other setup like setting the font for the UITextView...
        
        [textView reloadInputViews];
        [self.view addSubview:currentChapter];
        
    }else if(sender.tag == 2){
        filename = @"audioForScene2.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(160, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        
        textView.editable = NO;
        //myTextView.userInteractionEnabled = NO;
        textView.text = @"Texto 2";        
        [textView reloadInputViews];        
        [self.view addSubview:currentChapter];

    }else if(sender.tag == 3){
        filename = @"audioForScene3.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(200, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 4){
        filename = @"audioForScene4.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(240, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 5){
        filename = @"audioForScene5.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(280, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 6){
        filename = @"audioForScene6.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(320, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 7){
        filename = @"audioForScene7.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(360, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 8){
        filename = @"audioForScene8.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(400, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
    }else if(sender.tag == 9){
        filename = @"audioForScene9.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(440, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
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
    [playButton setHidden: NO];
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
    
    //COLOCANDO OS CODIGOS DENTRO DESTA FUNCAO FAZEMOS COM QUE TUDO ACONTECA DEPOIS
    //QUE A VIEW JA ESTEJA CARREGADA. PORTANTO NAO TEMOS SELF>BOUNDS RETORNA NA
    //ORIENTACAO CORRETA
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_narracao.jpg"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(200,20,282.0,110.0);
    textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:textView];
    [textView sizeToFit];
    
    UIImage *chap01BtnImage = [UIImage imageNamed:@"capitulo1.png"];
    UIImage *chap02BtnImage = [UIImage imageNamed:@"capitulo2.png"];
    UIImage *chap03BtnImage = [UIImage imageNamed:@"capitulo3.png"];
    UIImage *chap04BtnImage = [UIImage imageNamed:@"capitulo4.png"];
    UIImage *chap05BtnImage = [UIImage imageNamed:@"capitulo5.png"];
    UIImage *chap06BtnImage = [UIImage imageNamed:@"capitulo6.png"];
    UIImage *chap07BtnImage = [UIImage imageNamed:@"capitulo7.png"];
    UIImage *chap08BtnImage = [UIImage imageNamed:@"capitulo8.png"];
    UIImage *chap09BtnImage = [UIImage imageNamed:@"capitulo9.png"];
    
    chap01 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap01.frame = CGRectMake(120, 270, 40, 42);
    [chap01 setBackgroundImage:chap01BtnImage forState:UIControlStateNormal];
    chap01.tag = 1;
    [self.view addSubview:chap01];
    
    chap02 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap02.frame = CGRectMake(150, 270, 40, 42);
    [chap02 setBackgroundImage:chap02BtnImage forState:UIControlStateNormal];
    chap02.tag = 2;
    [self.view addSubview:chap02];
    
    chap03 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap03.frame = CGRectMake(190, 270, 40, 42);
    [chap03 setBackgroundImage:chap03BtnImage forState:UIControlStateNormal];
    chap03.tag = 3;
    [self.view addSubview:chap03];
    
    chap04 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap04.frame = CGRectMake(230, 270, 40, 42);
    [chap04 setBackgroundImage:chap04BtnImage forState:UIControlStateNormal];
    chap04.tag = 4;
    [self.view addSubview:chap04];
    
    chap05 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap05.frame = CGRectMake(270, 270, 40, 42);
    [chap05 setBackgroundImage:chap05BtnImage forState:UIControlStateNormal];
    chap05.tag = 5;
    [self.view addSubview:chap05];
    
    chap06 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap06.frame = CGRectMake(310, 270, 40, 42);
    [chap06 setBackgroundImage:chap06BtnImage forState:UIControlStateNormal];
    chap06.tag = 6;
    [self.view addSubview:chap06];
    
    chap07 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap07.frame = CGRectMake(350, 270, 40, 42);
    [chap07 setBackgroundImage:chap07BtnImage forState:UIControlStateNormal];
    chap07.tag = 7;
    [self.view addSubview:chap07];
    
    chap08 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap08.frame = CGRectMake(390, 270, 40, 42);
    [chap08 setBackgroundImage:chap08BtnImage forState:UIControlStateNormal];
    chap08.tag = 8;
    [self.view addSubview:chap08];
    
    chap09 = [UIButton buttonWithType:UIButtonTypeCustom];
    chap09.frame = CGRectMake(430, 270, 40, 42);
    [chap09 setBackgroundImage:chap09BtnImage forState:UIControlStateNormal];
    chap09.tag = 9;
    [self.view addSubview:chap09];
    
    playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   /*UIImage *recordButtonImage = [UIImage imageNamed:@"capitulo1.png"];
    recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *recordButtonImage2 = [UIImage imageNamed:@"capitulo2.png"];
    recordButton2 = [UIButton buttonWithType:UIButtonTypeCustom];*/
    stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    playButton.frame = CGRectMake(100, 50, 100, 30);
    //set the button's title
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    //add the button to the view
    [self.view addSubview:playButton];
    
    stopButton.frame = CGRectMake(100, 90, 100, 30);
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    
    /*recordButton.frame = CGRectMake(100, 140, 59, 64);
    //[recordButton setTitle:@"Record" forState:UIControlStateNormal];
    [recordButton setBackgroundImage:recordButtonImage forState:UIControlStateNormal];
    recordButton.tag = 1;
    [self.view addSubview:recordButton];*/
    
    /*recordButton2.frame = CGRectMake(100, 180, 59, 64);
    //[recordButton2 setTitle:@"Record Scene 2" forState:UIControlStateNormal];
    [recordButton2 setBackgroundImage:recordButtonImage2 forState:UIControlStateNormal];
    recordButton2.tag = 2;
    [self.view addSubview:recordButton2];*/
    
    //playButton.enabled = NO;
    //stopButton.enabled = NO;
    
    
    //LISTEN FOR CLICKS
    [playButton addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [chap01 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap02 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap03 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap04 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap05 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap06 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap07 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap08 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [chap09 addTarget:self action:@selector(recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
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
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        return YES;
    
    return NO;
}

@end
