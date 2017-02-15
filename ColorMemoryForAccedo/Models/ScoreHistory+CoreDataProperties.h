//
//  ScoreHistory+CoreDataProperties.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "ScoreHistory+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ScoreHistory (CoreDataProperties)

+ (NSFetchRequest<ScoreHistory *> *)fetchRequest;

@property (nonatomic) int16_t score;
@property (nullable, nonatomic, retain) LeaderBoard *name;

@end

NS_ASSUME_NONNULL_END
