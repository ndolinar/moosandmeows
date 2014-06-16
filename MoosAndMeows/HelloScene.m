//
//  HelloScene.m
//  MoosAndMeows
//
//  Created by Neja DOlinar on 16/06/14.
//  Copyright (c) 2014 Neja Dolinar. All rights reserved.
//

#define UIColorFromHEX(hexValue) [SKColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#import "HelloScene.h"
#import "LearnScene.h"

@interface HelloScene ()
@property BOOL contentCreated;
@property SKSpriteNode *playButton;
@property SKSpriteNode *learnButton;

@end
@implementation HelloScene

-(void)didMoveToView:(SKView *)view {
    if (!self.contentCreated) {
        self.contentCreated = YES;
        [self createContents];
    }
}


-(void)createContents {
    
    self.backgroundColor = UIColorFromHEX(0xfaadef);
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    [self addChild:[self addTitle]];
    [self addChild:[self addImage]];
    [self addChild:[self addLearnButton]];
    [self addChild:[self addPlayButton]];

    
}

-(SKSpriteNode*)addImage {
    SKSpriteNode *image = [SKSpriteNode spriteNodeWithImageNamed:@"cat_normal@2x.png"];
    image.name = @"catImage";
    image.size = CGSizeMake(160, 180);
    image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+20);

    return image;
}

-(SKLabelNode*)addTitle {
    SKLabelNode *titleNode = [SKLabelNode labelNodeWithFontNamed:@"Gill Sans"];
    titleNode.name = @"titleNode";
    titleNode.text = @"Moos and Meows";
    titleNode.fontSize = 30;
    titleNode.fontColor = [SKColor darkGrayColor];
    titleNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+150);
    return titleNode;
}

-(SKSpriteNode*)addLearnButton{
    self.learnButton = [SKSpriteNode spriteNodeWithImageNamed:@"learn_button.png"];
    self.learnButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-120);
    self.learnButton.size = CGSizeMake(70, 35);
    return self.learnButton;
}

-(SKSpriteNode*)addPlayButton {
    self.playButton = [SKSpriteNode spriteNodeWithImageNamed:@"play_button.png"];
    self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-170);
    self.playButton.size = CGSizeMake(70, 35);
    return self.playButton;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if([self.playButton containsPoint:location]) {
        
    }
    else if ([self.learnButton containsPoint:location]) {
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if([self.playButton containsPoint:location]) {
        
    }
    else if ([self.learnButton containsPoint:location]) {
        LearnScene *learn = [[LearnScene alloc]initWithSize:self.size];
        SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionUp duration:0.5];
        [self.view presentScene:learn transition:reveal];
    }
    
}

@end
