//
//  ScoreHistory+CoreDataProperties.m
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "ScoreHistory+CoreDataProperties.h"

@implementation ScoreHistory (CoreDataProperties)

+ (NSFetchRequest<ScoreHistory *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ScoreHistory"];
}

@dynamic score;
@dynamic name;

@end
