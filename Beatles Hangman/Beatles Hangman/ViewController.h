//
//  ViewController.h
//  Beatles Hangman
//
//  Created by Victoria Bian on 10/11/14.
//  Copyright (c) 2014 VIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic) IBOutlet UIImageView *currentImage;
@property (nonatomic) IBOutlet UILabel *wordLabel;
@property (nonatomic) NSString *secretWord;
@property (nonatomic) NSString *wrongLetters;


- (void) checkLetter: (NSString *) currentLetter;
- (void) initializeUI: (NSString *) hangmanWord;

@end

