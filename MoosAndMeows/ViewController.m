//
//  ViewController.m
//  MoosAndMeows
//
//  Created by Vladimir Stračkovski on 16/06/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "HelloScene.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated {
    SKView *spriteView = (SKView*)self.view;
    
    HelloScene *hello = [[HelloScene alloc]initWithSize:self.view.bounds.size];
    [spriteView presentScene:hello];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    SKView *spriteView = (SKView*)self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsFPS = YES;
    spriteView.showsNodeCount = YES;
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
