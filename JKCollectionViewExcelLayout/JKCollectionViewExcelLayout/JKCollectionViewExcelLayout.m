//
//  CustomCollectionViewLayout.m
//  Jakey
//
//  Created by Jakey on 2017/2/15.
//  Copyright (c) 2017 Jakey. All rights reserved.
//

#import "JKCollectionViewExcelLayout.h"

//#define NUMBEROFCOLUMNS 50

@interface JKCollectionViewExcelLayout ()
@property (strong, nonatomic) NSMutableArray *itemAttributes;
@property (strong, nonatomic) NSMutableArray *itemsSize;
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation JKCollectionViewExcelLayout
//prepareLayout -> collectionViewContentSize -> layoutAttributesForElementsInRect
- (void)prepareLayout
{
    [self.itemAttributes removeAllObjects];
    
    if ([self.collectionView numberOfSections] == 0) {
        return;
    }
    
    NSUInteger row = 0; // Current column inside row
    CGFloat xOffset = 0.0;
    CGFloat yOffset = 0.0;
    CGFloat contentWidth = 0.0; // To determine the contentSize
    CGFloat contentHeight = 0.0; // To determine the contentSize
//
    if (self.itemAttributes.count > 0) { // We don't enter in this if statement the first time, we enter the following times
        for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
            NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
            for (NSUInteger index = 0; index < numberOfItems; index++) {
                if (section != 0 && index != 0) { // This is a content cell that shouldn't be sticked
                    continue;
                }
                UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
                if (index == 0) { // We stick the first row
                    CGRect frame = attributes.frame;
                    frame.origin.y = self.collectionView.contentOffset.y;
                    attributes.frame = frame;

                }
                if (section == 0) { // We stick the first column
                    CGRect frame = attributes.frame;
                    frame.origin.x = self.collectionView.contentOffset.x;
                    attributes.frame = frame;
                }
            }
        }

        return;
    }
//
    // The following code is only executed the first time we prepare the layout
    self.itemAttributes = [@[] mutableCopy];
    self.itemsSize = [@[] mutableCopy];
    
    // Tip: If we don't know the number of columns we can call the following method and use the NSUInteger object instead of the NUMBEROFCOLUMNS macro
    // NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
    
    // We calculate the item size of each column
//    NSInteger itemsCount;
//    if (self.delegate && [self.delegate respondsToSelector:@selector(jk_numberOfColumnInCollectionView:)]) {
//        itemsCount = [self.delegate jk_numberOfColumnInCollectionView:self.collectionView];
//    }
//    if (self.itemsSize.count != itemsCount) {
//        [self calculateItemsSize];
//    }
    
    // We loop through all items
    NSInteger sectionNums = [self.collectionView numberOfSections];
    
    for (int section = 0; section < sectionNums; section++) {
        NSMutableArray *sectionAttributes = [@[] mutableCopy];
        for (NSUInteger index = 0; index <  [self.collectionView numberOfItemsInSection:section]; index++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];

            CGSize itemSize;
            if (self.delegate && [self.delegate respondsToSelector:@selector(jk_collectionView:layout:sizeForItemAtIndexPath:)]) {
                itemSize = [self.delegate jk_collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            }
            
            BOOL isGroup = NO;
            if (self.delegate && [self.delegate respondsToSelector:@selector(jk_collectionView:layout:isGroupForItemAtIndexPath:)]) {
                isGroup = [self.delegate jk_collectionView:self.collectionView layout:self isGroupForItemAtIndexPath:indexPath];
            }
            
       

            NSInteger numberForPre = 0;
            if (self.delegate && [self.delegate respondsToSelector:@selector(jk_collectionView:layout:numberItemsAtIndexPath:)]) {
                numberForPre = [self.delegate jk_collectionView:self.collectionView layout:self numberItemsAtIndexPath:indexPath];
            }
            
            // We create the UICollectionViewLayoutAttributes object for each item and add it to our array.
            // We will use this later in layoutAttributesForItemAtIndexPath:
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.zIndex = 512;

            //改变非0section的标题
            if (section!=0) {
                if (isGroup) {
                    CGFloat itemHeightTotal = itemSize.height * (index);
                    CGFloat canFloatTop =self.collectionView.contentOffset.y+ itemSize.height;
                    CGFloat final = MAX(itemHeightTotal,canFloatTop);
                    attributes.frame = CGRectIntegral(CGRectMake(itemSize.width, final, itemSize.width*(sectionNums-1), itemSize.height));
                }else{
                    attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));
                }
            }else{
                if (isGroup) {
                        CGFloat itemHeightTotal = itemSize.height * (index);
                        CGFloat canFloatTop =self.collectionView.contentOffset.y+ itemSize.height;
                        CGFloat final = MAX(itemHeightTotal,canFloatTop);
                        attributes.frame = CGRectIntegral(CGRectMake(xOffset, final, itemSize.width, itemSize.height));
                }else{
                    attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));

                }
            }
            if (section == 0 && index == 0) {
                attributes.zIndex = 1024; // Set this value for the first item (Sec0Row0) in order to make it visible over first column and first row
            } else if (section == 0 || index == 0) {
                attributes.zIndex = 1023; // Set this value for the first row or section in order to set visible over the rest of the items
            }
            if (isGroup){
                attributes.zIndex = 2024;
                if(section!=0){
                    attributes.zIndex = 2021;
                }
            }
            if (index == 0) {
                CGRect frame = attributes.frame;
                frame.origin.y = self.collectionView.contentOffset.y;
                attributes.frame = frame; // Stick to the top
            }
            if (section == 0) {
                CGRect frame = attributes.frame;
                frame.origin.x = self.collectionView.contentOffset.x;
                attributes.frame = frame; // Stick to the left
            }

            [sectionAttributes addObject:attributes];
            
            yOffset = yOffset+itemSize.height;
            row++;
            
            // Create a new row if this was the last column
            if (row ==  [self.collectionView numberOfItemsInSection:section]) {
                if (yOffset > contentHeight) {
                    contentHeight = yOffset;
                }
                
                // Reset values
                row = 0;
                yOffset = 0;
                xOffset += itemSize.width;
            }
        }
        [self.itemAttributes addObject:sectionAttributes];
    }
    
    // Get the last item to calculate the total height of the content
    UICollectionViewLayoutAttributes *attributes = [[self.itemAttributes lastObject] lastObject];
    contentWidth = attributes.frame.origin.x+2*attributes.frame.size.width;
    self.contentSize = CGSizeMake(contentWidth, contentHeight);
}
//返回collectionView的内容的尺寸
- (CGSize)collectionViewContentSize
{
    return self.contentSize;
}
//返回对应于indexPath的位置的cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.itemAttributes[indexPath.section][indexPath.row];
}
//返回rect中的所有的元素的布局属性
//返回的是包含UICollectionViewLayoutAttributes的NSArray
//UICollectionViewLayoutAttributes可以是cell，追加视图或装饰视图的信息，通过不同的UICollectionViewLayoutAttributes初始化方法可以得到不同类型的UICollectionViewLayoutAttributes：
//
//layoutAttributesForCellWithIndexPath:
//layoutAttributesForSupplementaryViewOfKind:withIndexPath:
//layoutAttributesForDecorationViewOfKind:withIndexPath:


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [@[] mutableCopy];
    for (NSArray *section in self.itemAttributes) {
        [attributes addObjectsFromArray:[section filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
            return CGRectIntersectsRect(rect, [evaluatedObject frame]);
        }]]];
    }
    
    return attributes;
}
//当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息。
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES; // Set this to YES to call prepareLayout on every scroll
}


@end
