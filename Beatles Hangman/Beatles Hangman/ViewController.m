//
//  ViewController.m
//  Beatles Hangman
//
//  Created by Victoria Bian on 10/11/14.
//  Copyright (c) 2014 VIC. All rights reserved.
//

#import "ViewController.h"
#import "HangmanWords.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize currentImage;
@synthesize wordLabel;
@synthesize secretWord;
@synthesize wrongLetters;


//- (void) dealloc
//{
//    [hangmanImage release];
//    [hangmanWordLabel release];
//    [correctWord release];
//    [wrongLetters release];
//    [super dealloc];
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HangmanWords *initializeWord=[[HangmanWords alloc]init];

    self.secretWord=[initializeWord getWord];
    [self initializeUI:self.secretWord];
    NSLog(@"Value of correct word = %@", secretWord);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"Value of letter = %@", string);
    NSString *upperCase = [string uppercaseString];

    [self checkLetter:upperCase];
//    if([textField.text length] >1)
//    {
//        [textField deleteBackward];
//    }
    [textField resignFirstResponder];


//    if (self.secretWord==self.wordLabel.text) {
//        NSLog(@"WIN IS TRUE");
//        [self showWinAlert];
//    }


    return YES;
}

- (IBAction)restartGame:(UIBarButtonItem *)sender {
    HangmanWords *initializeWord=[[HangmanWords alloc]init];
    
    self.secretWord=[initializeWord getWord];
    [self initializeUI:self.secretWord];
    NSLog(@"Value of letter = %@", self.secretWord);
}




- (void) checkLetter:(NSString *)currentLetter
{
    bool match=NO;
    bool dead=NO;

    NSRange hangmanLetterRange;
    char charToCheck = [currentLetter characterAtIndex:0];
    for (int i=0; i<self.secretWord.length; i++) {
        char tempLetter=[self.secretWord characterAtIndex:i];
        if (charToCheck==tempLetter) {
            match=YES;
            hangmanLetterRange=NSMakeRange(i, 1);
            self.wordLabel.text=[self.wordLabel.text stringByReplacingCharactersInRange:hangmanLetterRange withString:currentLetter];

        }
    }
    NSLog(@"Value of letter = %@", self.wordLabel.text);
    NSLog(@"Value of letter = %@", self.secretWord);
    
    if ([self.wordLabel.text isEqualToString:self.secretWord]) {
        NSLog(@"WIN IS TRUE");
        [self showWinAlert];
    }
    if (match==NO) {
        self.wrongLetters=[self.wrongLetters stringByReplacingOccurrencesOfString:currentLetter withString:@""];
        self.wrongLetters=[self.wrongLetters stringByAppendingString:currentLetter];
        
        switch (self.wrongLetters.length) {
            case 1:
                self.currentImage.image=[UIImage imageNamed:@"Hangman1.gif"];
                break;
            case 2:
                self.currentImage.image=[UIImage imageNamed:@"Hangman2.gif"];
                break;
            case 3:
                self.currentImage.image=[UIImage imageNamed:@"Hangman3.gif"];
                break;
            case 4:
                self.currentImage.image=[UIImage imageNamed:@"Hangman4.gif"];
                break;
            case 5:
                self.currentImage.image=[UIImage imageNamed:@"Hangman5.gif"];
                break;
            case 6:
                self.currentImage.image=[UIImage imageNamed:@"Hangman6.gif"];
                break;
            case 7:
                self.currentImage.image=[UIImage imageNamed:@"Hangman7.gif"];
                break;
            case 8:
                self.currentImage.image=[UIImage imageNamed:@"Hangman8.gif"];
            case 9:
                self.currentImage.image=[UIImage imageNamed:@"Hangman9.gif"];
                break;
            case 10:
                self.currentImage.image=[UIImage imageNamed:@"Hangman10.gif"];
                break;
            case 11:
                self.currentImage.image=[UIImage imageNamed:@"Hangman11.gif"];
                break;
            case 12:
                self.currentImage.image=[UIImage imageNamed:@"Hangman12.gif"];
                break;
            case 13:
                self.currentImage.image=[UIImage imageNamed:@"Hangman13.gif"];
                break;
            case 14:
                self.currentImage.image=[UIImage imageNamed:@"Hangman14.gif"];
                dead=YES;
                break;
                
            default:
                [self initializeUI:self.secretWord];
                break;
        }

    }
    if (dead) {
        NSLog(@"DEAD is TRUE");
        [self showDeadAlert];
    }

}
- (void) showDeadAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"Oops!"
                          message:@"You are dead!"
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];
}
- (void) showWinAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"Congrats!"
                          message:@"You won!"
                          delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil];
    
    [alert show];
}
- (void) initializeUI:(NSString *)hangmanWord
{
    self.wrongLetters=@"";
    self.wordLabel.text=@"";
    self.currentImage.image=[UIImage imageNamed:@"Hangman0.gif"];
    
    for (int i=0; i<hangmanWord.length; i++) {
        self.wordLabel.text=[self.wordLabel.text stringByAppendingString:@"-"];
    }
}

@end









