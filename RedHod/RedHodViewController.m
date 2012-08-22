//
//  RedHodViewController.m
//  RedHod
//
//  Created by Thiago Silva on 8/17/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

// TUTORIAIS PARA VER DEPOIS: http://www.iphonedevsdk.com/forum/iphone-sdk-tutorials/54516-global-variables.html
#import "RedHodViewController.h"
#import "AudioControls.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation RedHodViewController

//@synthesize recordButton, playButton, stopButton;
@synthesize chap01, chap02, chap03, chap04, chap05, chap06, chap07, chap08, chap09, currentChapter;
@synthesize textImage, textToRead;

-(void)chapterSelection:(UIButton *)sender {
    //[playButton setHidden: YES];
    [currentChapter setImage:nil];
    [textImage setImage:nil];
    //NSString *filename;

    //[recordButton setHidden:NO];
    //[playButton setHidden:NO];
    //[stopButton setHidden:NO];
    
    AudioControls *audioControls = [[AudioControls alloc] init];
    [audioControls resetButtons];
    
    CGPoint bottomOffset = CGPointMake(0, 0);
    [textToRead setContentOffset:bottomOffset animated:YES];
    
    if (sender.tag == 1){
        //filename = @"audioForScene1.caf"; ---> ESTAVA FUNCIONANDO COM ESTA LINHA APENAS
        fileName = @"audioForScene1.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(130, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];        
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 311)];
        [textImage setImage:[UIImage imageNamed:@"chap01text.png"]];
    }else if(sender.tag == 2){
        fileName = @"audioForScene2.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(160, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 1024)];
        [textImage setImage:[UIImage imageNamed:@"chap02text.png"]];
    }else if(sender.tag == 3){
        fileName = @"audioForScene3.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(200, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 108)];
        [textImage setImage:[UIImage imageNamed:@"chap03text.png"]];
    }else if(sender.tag == 4){
        fileName = @"audioForScene4.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(240, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 231)];
        [textImage setImage:[UIImage imageNamed:@"chap04text.png"]];
    }else if(sender.tag == 5){
        fileName = @"audioForScene5.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(280, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 257)];
        [textImage setImage:[UIImage imageNamed:@"chap05text.png"]];
    }else if(sender.tag == 6){
        fileName = @"audioForScene6.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(320, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 252)];
        [textImage setImage:[UIImage imageNamed:@"chap06text.png"]];
    }else if(sender.tag == 7){
        fileName = @"audioForScene7.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(360, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 537)];
        [textImage setImage:[UIImage imageNamed:@"chap07text.png"]];
    }else if(sender.tag == 8){
        fileName = @"audioForScene8.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(400, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 456)];
        [textImage setImage:[UIImage imageNamed:@"chap08text.png"]];
    }else if(sender.tag == 9){
        fileName = @"audioForScene9.caf";
        currentChapter = [[UIImageView alloc] initWithFrame:CGRectMake(440, 300, 20, 10)];
        [currentChapter setImage:[UIImage imageNamed:@"selected-mark.png"]];
        [self.view addSubview:currentChapter];
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 311)];
        [textImage setImage:[UIImage imageNamed:@"chap09text.png"]];
    }
    [textToRead addSubview:textImage];
    [textToRead setContentSize:CGSizeMake(textImage.frame.size.width, textImage.frame.size.height+5)];
    [textToRead setScrollEnabled:YES];
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
    
    AudioControls *audioControls = [[AudioControls alloc] init];
    //COLOCANDO OS CODIGOS DENTRO DESTA FUNCAO FAZEMOS COM QUE TUDO ACONTECA DEPOIS
    //QUE A VIEW JA ESTEJA CARREGADA. PORTANTO NAO TEMOS SELF>BOUNDS RETORNA NA
    //ORIENTACAO CORRETA
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_narracao.jpg"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    
    
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
    
    textToRead = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, 340, 170)];
    //[textToRead setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:textToRead];
    
    /*playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *recordButtonImage = [UIImage imageNamed:@"capitulo1.png"];
    recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *recordButtonImage2 = [UIImage imageNamed:@"capitulo2.png"];
    recordButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    playButton.frame = CGRectMake(100, 50, 100, 30);
    //set the button's title
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    //add the button to the view
    [self.view addSubview:playButton];
    
    stopButton.frame = CGRectMake(100, 90, 100, 30);
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];*/
    
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
    [audioControls drawControlButtons];
    [self.view addSubview:audioControls.recordButton];
    [self.view addSubview:audioControls.playButton];
    [self.view addSubview:audioControls.stopButton];
    //LISTEN FOR CLICKS
    [audioControls.playButton addTarget:self action:@selector([audioControls playAudio:]) forControlEvents:UIControlEventTouchUpInside];
    [chap01 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap02 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap03 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap04 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap05 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap06 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap07 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap08 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    [chap09 addTarget:self action:@selector(chapterSelection:) forControlEvents:UIControlEventTouchUpInside];
    //[stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    //[playButton addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [audioControls.recordButton addTarget:self action:@selector(audioControls:recordAudio:) forControlEvents:UIControlEventTouchUpInside];
    [audioControls.stopButton addTarget:self action:@selector(audioControls:stop:) forControlEvents:UIControlEventTouchUpInside];
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
