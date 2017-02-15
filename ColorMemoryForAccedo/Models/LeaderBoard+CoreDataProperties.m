//
//  LeaderBoard+CoreDataProperties.m
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "LeaderBoard+CoreDataProperties.h"

@implementation LeaderBoard (CoreDataProperties)

+ (NSFetchRequest<LeaderBoard *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"LeaderBoard"];
}

@dynamic name;
@dynamic score;

@end
