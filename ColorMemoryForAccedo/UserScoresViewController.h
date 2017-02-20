//
//  UserScoresViewController.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/16/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserScoresViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

    IBOutlet UITableView *tblUserScores;

}

@property (nonatomic, retain) NSString *gName;

@end
