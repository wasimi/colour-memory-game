//
//  ViewController.m
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    NSMutableArray *cardDeck;
    NSMutableArray *shuffledDeck;
    NSMutableArray *colorSet;
    NSMutableArray *selectedIndices;
    NSDictionary *colorKeys;
    NSInteger score;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   cardDeck = [[NSMutableArray alloc] init];
   shuffledDeck = [[NSMutableArray alloc] init];
    colorSet = [[NSMutableArray alloc] init];
    selectedIndices = [[NSMutableArray alloc] init];
    NSString *pathToResource = [[NSBundle mainBundle] pathForResource:@"ColorKeys" ofType:@"plist"];
    colorKeys = [[NSDictionary alloc] initWithContentsOfFile:pathToResource];
    
    [self makeStack];
    
    [cardLayout registerNib:[UINib nibWithNibName:@"CardViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CardViewCell"];
    [cardLayout reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 16;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"CardViewCell" forIndexPath:indexPath];
    if(!cell){
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CardViewCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    UIImageView *cardFaceDown = (UIImageView *)[cell.contentView viewWithTag:101];
    [cardFaceDown setImage:[UIImage imageNamed:cardDeck[indexPath.row]]];
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([selectedIndices containsObject:indexPath]) {
        return;
    }
    
    if ([[cardDeck objectAtIndex:indexPath.row] isEqualToString:@"card_bg.png"]) {
        if (colorSet.count<3) {
            
            [colorSet addObject:indexPath];
        }
        
        [cardDeck replaceObjectAtIndex:indexPath.row withObject:shuffledDeck[indexPath.row]];

        [selectedIndices addObject:indexPath];
        [cardLayout reloadData];
        
        if (colorSet.count == 2) {
            [cardLayout setUserInteractionEnabled:NO];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                         1 * NSEC_PER_SEC),
                           dispatch_get_main_queue(),
                           ^{
                               // Do whatever you want here.
                               [self compareAndScoreAtIndexPaths:colorSet];
                           });
            

        }
        
       
    }

}

- (void)compareAndScoreAtIndexPaths:(NSMutableArray *)colorSets {
    
    if (colorSets.count==2) {
        NSIndexPath *color1 = colorSets[0];
        NSIndexPath *color2 = colorSets[1];
        if ([[cardDeck objectAtIndex:color1.row] isEqualToString:[cardDeck objectAtIndex:color2.row]]) {
            score = score + 2;
            if (selectedIndices.count==16) {
                UIAlertController *gameOver = [UIAlertController alertControllerWithTitle:@"Game Over" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
                [gameOver addAction:ok];
                [self presentViewController:gameOver animated:YES completion:nil];
            }
        }
        else {
            
            score = score - 1;
            [cardDeck replaceObjectAtIndex:color1.row withObject:@"card_bg.png"];
            [cardDeck replaceObjectAtIndex:color2.row withObject:@"card_bg.png"];
            [selectedIndices removeObjectAtIndex:[selectedIndices indexOfObject:color1]];
            [selectedIndices removeObjectAtIndex:[selectedIndices indexOfObject:color2]];
        }
        NSLog(@"%li",(long)score);
        [lblScore setText:[NSString stringWithFormat:@"%i",score]];
        colorSet = [[NSMutableArray alloc] init];
    }
    [cardLayout reloadData];
    [cardLayout setUserInteractionEnabled:YES];
}


- (IBAction)restartGame:(id)sender{
    
    score = 0;
    
    [selectedIndices removeAllObjects];
    [cardDeck removeAllObjects];
    [colorSet removeAllObjects];
    [shuffledDeck removeAllObjects];
    
    [self makeStack];
    
    [cardLayout reloadData];
    
    [lblScore setText:[NSString stringWithFormat:@"%i",score]];

}

-(void)makeStack{

    int j = 1;
    for (int i = 0; i<16; i++) {
        [cardDeck addObject:@"card_bg.png"];
        if (j>8) {
            j=1;
        }
        [shuffledDeck addObject:[NSString stringWithFormat:@"colour%i.png",j]];
        j++;
        
    }
    
    [shuffledDeck shuffle];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
