//
//  ViewController.m
//  Splash Screen
//
//  Created by Sreekala Santhakumari on 2/15/17.
//  Copyright © 2017 Klas. All rights reserved.
//
 #import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ( [userDefaults boolForKey:@"hideLabel"] ==  NO ) {
    
        [userDefaults setValue:self.welcomeLabel.text forKey:@"hideLabel"];
        
        //Animations & change of viewController
        
        [UIView animateWithDuration:5.0f animations:^{self.welcomeLabel.alpha=1.0f;

        } completion:^(BOOL finished) {
            [UIView animateWithDuration:5.0f animations:^{self.welcomeLabel.alpha = 0.0f;
               
           } completion:^(BOOL finished) {
              [self performSegueWithIdentifier:@"segueToNewViewController" sender:self];
          }];
       }];
        
        [userDefaults setBool: YES forKey:@"hideLabel"];
        
        [userDefaults synchronize];
        
        
    } else {
        
        self.welcomeLabel.alpha =0.00f;
        [UIView animateWithDuration:5.0f animations:^{self.welcomeLabel.alpha = 0.0f;
            
        } completion:^(BOOL finished) {
            [self performSegueWithIdentifier:@"segueToNewViewController" sender:self];
        }];

        [self performSegueWithIdentifier:@"segueToNewViewController" sender:self];
        
       // [userDefaults setBool: NO forKey:@"hideLabel"];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
