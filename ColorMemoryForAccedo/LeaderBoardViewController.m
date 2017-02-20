//
//  LeaderBoardViewController.m
//  ColorMemoryForAccedo
//
//  Created by User on 2/16/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "LeaderBoardViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "LeaderBoard+CoreDataClass.h"
#import "ScoreHistory+CoreDataClass.h"
#import "HighScoresCell.h"
#import "UserScoresViewController.h"

@interface LeaderBoardViewController (){

    NSMutableArray *allNames;
    NSManagedObjectContext *managedObjectContext;
    
    NSMutableDictionary *namesAndHighScore;
    
}

@end

@implementation LeaderBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    allNames = [[NSMutableArray alloc] init];
    managedObjectContext = [[(AppDelegate *)[UIApplication sharedApplication].delegate persistentContainer] viewContext];
    [self loadData];
    
}

-(void)loadData {
    
    NSFetchRequest *fetchRequest = [LeaderBoard fetchRequest];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error!=nil) {
        NSLog(@"Error while fetching data");
    }
    
    if (results.count>0) {
        
        //can create dictionary of users and high score as data to display
        namesAndHighScore = [[NSMutableDictionary alloc] init];
        for (LeaderBoard *gamer in results) {
            ScoreHistory *firstScore = gamer.scoreHistory.allObjects[0];
            int high_score = firstScore.score;
            for (ScoreHistory *gScore in gamer.scoreHistory) {
                if (high_score < gScore.score) {
                    high_score = gScore.score;
                }
            }
            
            [namesAndHighScore setValue:[NSString stringWithFormat:@"%i",high_score] forKey:gamer.name];
            [allNames addObject:gamer.name];
        }
        
    }
    
    [tblHighScores reloadData];
    

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  allNames.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HighScoresCell *cell = [tblHighScores dequeueReusableCellWithIdentifier:@"HighScoreCell"];
    
    cell.lblName.text = [allNames objectAtIndex:indexPath.row];
    
    cell.lblHighScore.text = [namesAndHighScore valueForKey:[allNames objectAtIndex:indexPath.row]];
    
    return cell;


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexOfName = tblHighScores.indexPathForSelectedRow;
    self.userName = [allNames objectAtIndex:indexOfName.row];
    UserScoresViewController *vcUserScores = segue.destinationViewController;
    vcUserScores.gName = self.userName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
