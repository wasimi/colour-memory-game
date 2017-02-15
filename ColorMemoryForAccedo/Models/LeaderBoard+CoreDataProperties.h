//
//  LeaderBoard+CoreDataProperties.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/14/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "LeaderBoard+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LeaderBoard (CoreDataProperties)

+ (NSFetchRequest<LeaderBoard *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ScoreHistory *> *score;

@end

@interface LeaderBoard (CoreDataGeneratedAccessors)

- (void)addScoreObject:(ScoreHistory *)value;
- (void)removeScoreObject:(ScoreHistory *)value;
- (void)addScore:(NSSet<ScoreHistory *> *)values;
- (void)removeScore:(NSSet<ScoreHistory *> *)values;

@end

NS_ASSUME_NONNULL_END
