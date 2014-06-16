//
//  LearnScene.m
//  MoosAndMeows
//
//  Created by Vladimir Stračkovski on 16/06/14.
//  Copyright (c) 2014 Vladimir Stračkovski. All rights reserved.
//

#import "LearnScene.h"
#import <AVFoundation/AVFoundation.h>

#define UIColorFromHEX(hexValue) [SKColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

@interface LearnScene () {
    int meowCount;
}
@property BOOL contentCreated;
@property (nonatomic,strong) AVAudioPlayer *meowSound;
@property (nonatomic,strong) AVAudioPlayer *hissSound;

@property SKSpriteNode *upperLeft;
@property SKSpriteNode *upperMiddle;
@property SKSpriteNode *upperRight;

@property SKSpriteNode *middleLeft;
@property SKSpriteNode *middleMiddle;
@property SKSpriteNode *middleRight;

@property SKSpriteNode *lowerLeft;
@property SKSpriteNode *lowerMiddle;
@property SKSpriteNode *lowerRight;

@property SKSpriteNode *catNode;
@property SKSpriteNode *pigNode;

@end
@implementation LearnScene

-(void)didMoveToView:(SKView *)view {
    if(!self.contentCreated) {
        self.contentCreated = YES;
        meowCount = 0;
        self.scaleMode = SKSceneScaleModeAspectFit;

        [self createContents];
        
        self.meowSound = [self setupAudioFile:@"meowing" type:@"mp3"];
        self.hissSound = [self setupAudioFile:@"angryCat" type:@"mp3"];
    }
}

-(void)createContents {
    self.backgroundColor = UIColorFromHEX(0xfbf1da);
    
    [self addChild:[self newUpperLeftSquare]];
    [self addChild:[self newUpperRightSquare]];

}

-(AVAudioPlayer*)setupAudioFile:(NSString*)file type:(NSString*)type {

    NSString *path = [[NSBundle mainBundle]pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    if(!audioPlayer) {
        NSLog(@"%@", [error description]);
    }
    
    return audioPlayer;
}


//squares
-(SKSpriteNode*)newUpperLeftSquare {
    self.upperLeft = [SKSpriteNode spriteNodeWithColor:UIColorFromHEX(0xb4e5ec) size:CGSizeMake(self.size.width/2, self.size.width/2)];
    
    self.upperLeft.position = CGPointMake(self.size.width/4, self.size.height-self.upperLeft.size.height/2);
    
    //add a cat
    [self.upperLeft addChild:[self newCatNode]];
    
    return self.upperLeft;
}


-(SKSpriteNode*)newUpperMiddleSquare {
    SKSpriteNode *upperMiddleSquare = [SKSpriteNode spriteNodeWithColor:UIColorFromHEX(0xc48be8) size:CGSizeMake(self.size.width/3, self.size.width/3)];
    upperMiddleSquare.position = CGPointMake(self.size.width/2, self.size.height-upperMiddleSquare.size.height/2);
    
    
    return upperMiddleSquare;
    
}

-(SKSpriteNode*)newUpperRightSquare {
    self.upperRight = [SKSpriteNode spriteNodeWithColor:UIColorFromHEX(0xf2f2f2) size:CGSizeMake(self.size.width/2, self.size.width/2)];
    self.upperRight.position = CGPointMake(self.size.width-self.upperRight.size.width/2, self.size.height-self.upperRight.size.height/2);
    [self.upperRight addChild:[self newPigNode]];
    
    return self.upperRight;
    
}

-(SKSpriteNode*)newCatNode {
    self.catNode = [SKSpriteNode spriteNodeWithImageNamed:@"cat_normal@2x.png"];
    self.catNode.name = @"catNode";
    self.catNode.size = CGSizeMake(100, 113);
    self.catNode.position = CGPointMake(0,0);
    
    SKTextureAtlas *catAtlas = [SKTextureAtlas atlasNamed:@"catBlink"];
    
    
    SKTexture *c1 = [catAtlas textureNamed:@"cat001.png"];
    SKTexture *c2 = [catAtlas textureNamed:@"cat002.png"];
    SKTexture *c3 = [catAtlas textureNamed:@"cat003.png"];
    
    NSArray *catBlinkTextures = @[c1,c2,c3];
    
    SKAction *firstBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.07];
    SKAction *secondBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.1];
    SKAction *wait = [SKAction waitForDuration:5.0];
    SKAction *thirdBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.1];
    SKAction *wait2 = [SKAction waitForDuration:3.5];
    SKAction *sequence = [SKAction sequence:@[wait2, firstBlinkAnimation, secondBlinkAnimation, wait, thirdBlinkAnimation, wait2]];
   
    
    SKAction *blinkForever = [SKAction repeatActionForever:sequence];
    [self.catNode runAction:blinkForever withKey:@"blinkingCat"];
    
    return self.catNode;
}

-(SKSpriteNode*)newPigNode {
    self.pigNode = [SKSpriteNode spriteNodeWithImageNamed:@"pig_normal@2x.png"];
    self.pigNode.name = @"pigNode";
    self.pigNode.size = CGSizeMake(110, 116);
    self.pigNode.position = CGPointMake(0,0);
    
    SKTextureAtlas *pigAtlas = [SKTextureAtlas atlasNamed:@"pigBlink"];
    
    SKTexture *c1 = [pigAtlas textureNamed:@"pig001.png"];
    SKTexture *c2 = [pigAtlas textureNamed:@"pig002.png"];
    SKTexture *c3 = [pigAtlas textureNamed:@"pig003.png"];
    
    NSArray *catBlinkTextures = @[c1,c2,c3];
    
    SKAction *firstBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.07];
    SKAction *secondBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.1];
    SKAction *wait = [SKAction waitForDuration:5.0];
    SKAction *thirdBlinkAnimation = [SKAction animateWithTextures:catBlinkTextures timePerFrame:0.1];
    SKAction *wait2 = [SKAction waitForDuration:3.5];
    SKAction *sequence = [SKAction sequence:@[wait2, firstBlinkAnimation, secondBlinkAnimation, wait2, thirdBlinkAnimation, wait]];
    
    SKAction *blinkForever = [SKAction repeatActionForever:sequence];
    [self.pigNode runAction:blinkForever withKey:@"blinkingPig"];

    return self.pigNode;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([self.upperLeft containsPoint:location]) {
        meowCount += 1;
        
        SKTexture *c1 = [SKTexture textureWithImage:[UIImage imageNamed:@"cat004.png"]];
        SKTexture *c2 = [SKTexture textureWithImage:[UIImage imageNamed:@"cat_sad.png"]];
        SKTexture *c3 = [SKTexture textureWithImage:[UIImage imageNamed:@"cat_angry.png"]];
        
        //build cat meow sequence
        SKAction *meow = [SKAction setTexture:c1];
        SKAction *wait12 = [SKAction waitForDuration:1.2];
        SKAction *longWait = [SKAction waitForDuration:2.4];
        SKAction *shortWait = [SKAction waitForDuration:0.7];
        
        //cat meow
        SKAction *cat_meows = [SKAction sequence:@[meow, wait12]];
        
        //cat growl
        SKAction *cat_growls = [SKAction setTexture:c2];
        
        //cat hiss
        SKAction *cat_hisses = [SKAction setTexture:c3];
        
        SKAction *hissing = [SKAction sequence:@[cat_growls, longWait, cat_hisses, shortWait]];
        
        //build cat blink
        SKTextureAtlas *catBlinkAtlas = [SKTextureAtlas atlasNamed:@"catBlink"];
        SKTexture *b1 = [catBlinkAtlas textureNamed:@"cat001.png"];
        SKTexture *b2 = [catBlinkAtlas textureNamed:@"cat002.png"];
        SKTexture *b3 = [catBlinkAtlas textureNamed:@"cat003.png"];
        
        NSArray *blink = @[b1,b2,b3];
        
        SKAction *blink1 = [SKAction animateWithTextures:blink timePerFrame:0.07];
        SKAction *blink2 = [SKAction animateWithTextures:blink timePerFrame:0.1];
        SKAction *blinkWait = [SKAction waitForDuration:5.0];
        SKAction *blink3 = [SKAction animateWithTextures:blink timePerFrame:0.1];
        SKAction *blinkWait2 = [SKAction waitForDuration:3.5];
        SKAction *blinkSequence = [SKAction sequence:@[blink1, blinkWait2, blink2, blinkWait, blink3, blinkWait2]];
        
        SKAction *blinkForever = [SKAction repeatActionForever:blinkSequence];
        
        [self.catNode removeActionForKey:@"blinkingCat"];
        
        if(meowCount < 3) {
            [self.meowSound play];
            [self.catNode runAction:cat_meows completion:^{
                [self.catNode runAction:blinkForever withKey:@"blinkingCat"];
            }];
        }
        else {
            meowCount = 0;
            [self.hissSound play];
            [self.catNode runAction:hissing completion:^{
                [self.catNode runAction:blinkForever withKey: @"blinkingCat"];
            
            }];
        }
        
    }
    else if ([self.upperRight containsPoint:location]) {
        
    }
    
}



@end
