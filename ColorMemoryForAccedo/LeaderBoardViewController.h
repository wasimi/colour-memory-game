//
//  LeaderBoardViewController.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/16/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaderBoardViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UITableView *tblHighScores;


}

@property(nonatomic, retain) NSString *userName;

@end
