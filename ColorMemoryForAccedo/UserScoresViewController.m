//
//  UserScoresViewController.m
//  ColorMemoryForAccedo
//
//  Created by User on 2/16/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "UserScoresViewController.h"
#import <CoreData/CoreData.h>
#import "LeaderBoard+CoreDataClass.h"
#import "ScoreHistory+CoreDataClass.h"
#import "AppDelegate.h"

@interface UserScoresViewController (){

NSManagedObjectContext *managedObjectContext;
    NSMutableArray *userScores;
}

@end

@implementation UserScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    managedObjectContext = [[(AppDelegate *)[UIApplication sharedApplication].delegate persistentContainer] viewContext];
    userScores = [[NSMutableArray alloc] init];
    [self loadData];
}

-(void)loadData {


    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"name=='%@'",self.gName]];
    NSFetchRequest *fetchRequest = [LeaderBoard fetchRequest];
    [fetchRequest setPredicate:predicate];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (results.count>0) {
        
        LeaderBoard *gamer = results[0];
        userScores = (NSMutableArray *)gamer.scoreHistory.allObjects;
        
        
    }
    [tblUserScores reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  userScores.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApplicationItemCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ApplicationItemCell"];
    }
    
    ScoreHistory *userScore = [userScores objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%i",userScore.score];
    
    return cell;
    
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
