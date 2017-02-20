//
//  LeaderBoard+CoreDataProperties.h
//  ColorMemoryForAccedo
//
//  Created by User on 2/15/17.
//  Copyright © 2017 Wasim. All rights reserved.
//

#import "LeaderBoard+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface LeaderBoard (CoreDataProperties)

+ (NSFetchRequest<LeaderBoard *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ScoreHistory *> *scoreHistory;

@end

@interface LeaderBoard (CoreDataGeneratedAccessors)

- (void)addScoreHistoryObject:(ScoreHistory *)value;
- (void)removeScoreHistoryObject:(ScoreHistory *)value;
- (void)addScoreHistory:(NSSet<ScoreHistory *> *)values;
- (void)removeScoreHistory:(NSSet<ScoreHistory *> *)values;

@end

NS_ASSUME_NONNULL_END
