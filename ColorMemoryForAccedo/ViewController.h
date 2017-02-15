//
//  ViewController.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

{
    
    IBOutlet UICollectionView *cardLayout;
    IBOutlet UILabel *lblScore;

}

- (IBAction)restartGame:(id)sender;

@end

