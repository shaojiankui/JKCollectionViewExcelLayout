//
//  CustomCollectionViewLayout.h
//  Jakey
//
//  Created by Jakey on 2017/2/15.
//  Copyright (c) 2017 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

// NOTE: This class is not used in this project - actually it is removed from the target. I added it just in case you need to compare the code between Objective-C and Swift
@class JKCollectionViewExcelLayout;

@protocol JKCollectionViewExcelLayoutDelegate <NSObject>
@optional
- (CGSize)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

- (BOOL)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout isGroupForItemAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout numberItemsAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface JKCollectionViewExcelLayout : UICollectionViewLayout
@property (nonatomic, weak) id <JKCollectionViewExcelLayoutDelegate> delegate;
@end
