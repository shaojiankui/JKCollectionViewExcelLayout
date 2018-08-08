//
//  ViewController.m
//  JKCollectionViewExcelLayout
//
//  Created by Jakey on 2017/2/15.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "ViewController.h"
#import "JKCollectionViewExcelLayout.h"
#import "ReportCell.h"
#import "ReportNameCell.h"
#import "HeaderReusableView.h"
@interface ViewController ()
{
    NSMutableArray *_items;
    //    NSArray *_columnItems;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JKCollectionViewExcelLayout *layout = (id)self.myCollectionView.collectionViewLayout;
    layout.delegate = self;
    
    if (@available(iOS 11.0, *)){
        self.myCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
 
    self.automaticallyAdjustsScrollViewInsets  = NO;
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"ReportCell" bundle:nil] forCellWithReuseIdentifier:@"ReportCell"];
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"ReportNameCell" bundle:nil] forCellWithReuseIdentifier:@"ReportNameCell"];
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderReusableView class]) bundle:nil]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderReusableView"];
    
    
    [self loadData];
}


- (void)loadData{
    //    _columnItems = @[@"姓名",@"箱",@"个",@"总计"];
    _items = [@[
                @{@"对比0":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                                                @{@"name":@"参数0",@"value":@"value0"},
                                                                @{@"name":@"参数1",@"value":@"value1"},
                                                                @{@"name":@"参数2",@"value":@"value2"},
                                                                @{@"name":@"参数3",@"value":@"value3"},
                                                                @{@"name":@"参数5",@"value":@"value5"},
                                                                @{@"name":@"参数6",@"value":@"value5"},
                                                                @{@"name":@"参数7",@"value":@"value5"},
                                                                @{@"name":@"参数8",@"value":@"value5"},
                                                                @{@"name":@"参数9",@"value":@"value5"}
                                                                ]},

                          @{@"sectionName":@"分组1",@"cells":@[
                                                                @{@"name":@"参数0",@"value":@"value0"},
                                                                @{@"name":@"参数1",@"value":@"value1"},
                                                                @{@"name":@"参数2",@"value":@"value2"},
                                                                @{@"name":@"参数3",@"value":@"value3"},
                                                                @{@"name":@"参数4",@"value":@"value4"}
                                                                ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                                                @{@"name":@"参数0",@"value":@"value0"},
                                                                @{@"name":@"参数1",@"value":@"value1"},
                                                                @{@"name":@"参数2",@"value":@"value2"},
                                                                @{@"name":@"参数3",@"value":@"value3"},
                                                                @{@"name":@"参数4",@"value":@"value4"},
                                                                @{@"name":@"参数5",@"value":@"value5"},
                                                                @{@"name":@"参数6",@"value":@"value5"},
                                                                @{@"name":@"参数7",@"value":@"value5"},
                                                                @{@"name":@"参数8",@"value":@"value5"},
                                                                @{@"name":@"参数9",@"value":@"value5"},
                                                                @{@"name":@"参数10",@"value":@"value5"},
                                                                @{@"name":@"参数11",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"},
                                                                @{@"name":@"参数12",@"value":@"value5"}
                                                                ]}

                          
                          ]},
                    
                @{@"对比1":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"}
                                    ]},
                          
                          @{@"sectionName":@"分组1",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"}
                                    ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"},
                                    @{@"name":@"参数10",@"value":@"value5"},
                                    @{@"name":@"参数11",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"}
                                    ]}
                          
                          
                          ]},
                @{@"对比2":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"}
                                    ]},
                          
                          @{@"sectionName":@"分组1",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"}
                                    ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"},
                                    @{@"name":@"参数10",@"value":@"value5"},
                                    @{@"name":@"参数11",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"}
                                    ]}
                          
                          
                          ]},
                @{@"对比3":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"}
                                    ]},
                          
                          @{@"sectionName":@"分组1",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"}
                                    ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"},
                                    @{@"name":@"参数10",@"value":@"value5"},
                                    @{@"name":@"参数11",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"}
                                    ]}
                          
                          
                          ]},
                @{@"对比4":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"}
                                    ]},
                          
                          @{@"sectionName":@"分组1",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"}
                                    ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"},
                                    @{@"name":@"参数10",@"value":@"value5"},
                                    @{@"name":@"参数11",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"}
                                    ]}
                          
                          
                          ]}
                ,
                @{@"对比5":@[
                          @{@"sectionName":@"分组0",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"}
                                    ]},
                          
                          @{@"sectionName":@"分组1",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"}
                                    ]},
                          @{@"sectionName":@"分组2",@"cells":@[
                                    @{@"name":@"参数0",@"value":@"value0"},
                                    @{@"name":@"参数1",@"value":@"value1"},
                                    @{@"name":@"参数2",@"value":@"value2"},
                                    @{@"name":@"参数3",@"value":@"value3"},
                                    @{@"name":@"参数4",@"value":@"value4"},
                                    @{@"name":@"参数5",@"value":@"value5"},
                                    @{@"name":@"参数6",@"value":@"value5"},
                                    @{@"name":@"参数7",@"value":@"value5"},
                                    @{@"name":@"参数8",@"value":@"value5"},
                                    @{@"name":@"参数9",@"value":@"value5"},
                                    @{@"name":@"参数10",@"value":@"value5"},
                                    @{@"name":@"参数11",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"},
                                    @{@"name":@"参数12",@"value":@"value5"}
                                    ]}
                          
                          
                          ]}
                  ]
                
                mutableCopy];
//    [_items insertObject:@{@"名称":@{@"name":@"参数1",@"values":@[@"123",@"123",@"123",@"123",@"123",@"123",@"123"]}} atIndex:0];
    //    JKCollectionViewExcelLayout *layout = (id)self.myCollectionView.collectionViewLayout;
    [self.myCollectionView reloadData];
    //    [layout invalidateLayout];
    
}
 #pragma mark - 头部或者尾部视图
- (CGSize)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 40);
}

#pragma mark -
#pragma mark Collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //    [collectionView.collectionViewLayout invalidateLayout];
    return [_items count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSDictionary *bigSectionData = [_items objectAtIndex:section];
    NSArray *items = [[bigSectionData allValues] lastObject];
    
    NSInteger cellCount = 0;
    for (NSDictionary *cellData in items) {
        NSArray *cells = [cellData objectForKey:@"cells"];
        cellCount += [cells count];
    }
    cellCount += [items count]-1;

    return cellCount;
}
- (BOOL)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout isGroupForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *bigSectionData = [_items objectAtIndex:indexPath.section];
    NSArray *items = [[bigSectionData allValues] lastObject];
    
    NSMutableArray *nameArrays = [NSMutableArray array];
    [nameArrays addObject:@{@"name":@"sectionx",@"value":@""}];
    for (NSDictionary *cellData in items) {
        NSArray *cells = [cellData objectForKey:@"cells"];
        [nameArrays addObject:@{@"isGroup":@"1",@"name":[cellData objectForKey:@"sectionName"],@"value":[cellData objectForKey:@"sectionName"]}];
        [nameArrays  addObjectsFromArray:cells];;
    }
    
    NSDictionary *dic = [nameArrays objectAtIndex:indexPath.row];
    if ([[dic objectForKey:@"isGroup"] boolValue]) {
        return YES;
    }
    return NO;
}
- (NSInteger)jk_collectionView:(UICollectionView *)collectionView layout:(JKCollectionViewExcelLayout*)collectionViewLayout numberItemsAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *bigSectionData = [_items objectAtIndex:indexPath.section];
    NSArray *items = [[bigSectionData allValues] lastObject];
    
    NSMutableArray *nameArrays = [NSMutableArray array];
    [nameArrays addObject:@{@"name":@"sectionx",@"value":@""}];
    for (NSDictionary *cellData in items) {
        NSArray *cells = [cellData objectForKey:@"cells"];
        [nameArrays addObject:@{@"isGroup":@"1",@"name":[cellData objectForKey:@"sectionName"],@"value":[cellData objectForKey:@"sectionName"]}];
        [nameArrays  addObjectsFromArray:cells];
    }
    
   
    return indexPath.row;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *bigSectionData = [_items objectAtIndex:indexPath.section];
    NSArray *items = [[bigSectionData allValues] lastObject];
    
    NSMutableArray *nameArrays = [NSMutableArray array];
    [nameArrays addObject:@{@"name":@"sectionx",@"value":@""}];
    for (NSDictionary *cellData in items) {
        NSArray *cells = [cellData objectForKey:@"cells"];
        [nameArrays addObject:@{@"isGroup":@"1",@"name":[cellData objectForKey:@"sectionName"],@"value":[cellData objectForKey:@"sectionName"]}];
        [nameArrays  addObjectsFromArray:cells];;
    }
    
    
    if (indexPath.row == 0)
    {
        
        if (indexPath.section == 0)
        {
            ReportNameCell *cell = (ReportNameCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ReportNameCell" forIndexPath:indexPath];
            //            cell.nameLabel.text =  [[_items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            cell.nameLabel.font = [UIFont boldSystemFontOfSize:25];
            
        
            cell.nameLabel.text = [NSString stringWithFormat:@"s:%zd,r:%zd",indexPath.section,indexPath.row];
            cell.backgroundColor = [UIColor redColor];

            return cell;
        }
        else
        {
            ReportCell *cell = (ReportCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ReportCell" forIndexPath:indexPath];
            cell.contentLabel.text = [NSString stringWithFormat:@"%zd,%zd",indexPath.section,indexPath.row];
            //            cell.contentLabel.text = [[_items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            cell.contentLabel.font = [UIFont boldSystemFontOfSize:25];
            cell.backgroundColor = [UIColor greenColor];
            
            NSDictionary *bigSectionData = [_items objectAtIndex:indexPath.section];
            cell.contentLabel.text = [[bigSectionData allKeys] firstObject];
            return cell;
        }
    }
    else
    {
        if (indexPath.section == 0)
        {
            ReportNameCell *cell = (ReportNameCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ReportNameCell" forIndexPath:indexPath];
            //             cell.nameLabel.text = [NSString stringWithFormat:@"%zd",indexPath.section];
            //            cell.nameLabel.text = [[[_items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] description];
            //            cell.nameLabel.font = [UIFont systemFontOfSize:22];
            NSDictionary *itemDic = [nameArrays objectAtIndex:indexPath.row];

            cell.nameLabel.text = [NSString stringWithFormat:@"%zd,%zd",indexPath.section,indexPath.row];
            if ([[itemDic objectForKey:@"isGroup"] boolValue]) {
                cell.backgroundColor = [UIColor darkGrayColor];
            }else{
                cell.backgroundColor = [UIColor redColor];
            }
            cell.nameLabel.text = [[nameArrays objectAtIndex:indexPath.row] objectForKey:@"name"];

            return cell;
        }
        
        else
        {
            ReportCell *cell = (ReportCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ReportCell" forIndexPath:indexPath];
            cell.contentLabel.text = [NSString stringWithFormat:@"%zd,%zd",indexPath.section,indexPath.row];
            //            cell.contentLabel.text = [[[_items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] description];
            cell.contentLabel.font = [UIFont systemFontOfSize:22];
          
            NSDictionary *itemDic = [nameArrays objectAtIndex:indexPath.row];
            cell.contentLabel.text = [itemDic objectForKey:@"value"];

            
            
            if ([[itemDic objectForKey:@"isGroup"] boolValue]) {
                cell.backgroundColor = [UIColor darkGrayColor];
            }else{
                cell.backgroundColor = [UIColor yellowColor];
            }
            return cell;
        }
    }

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (collectionView.bounds.size.width - 30) / 50;
    return CGSizeMake(width, 50);
}


@end
