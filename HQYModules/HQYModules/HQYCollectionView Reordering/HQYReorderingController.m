//
//  HQYReorderingController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/5/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYReorderingController.h"
#import "HQYReorderingCell.h"

#define HQYScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define HQYScreenHeight  ([UIScreen mainScreen].bounds.size.height)

@interface HQYReorderingController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *reorderingCollectionView;

/** 素材图片 */
@property (nonatomic, strong) NSMutableArray *imagesArrayM;
/** 保存所有布局属性cell */
@property (nonatomic, strong) NSMutableArray *layoutAttributesCellArrayM;

@end

static NSString * const HQYReorderingControllerID = @"cell";

@implementation HQYReorderingController

#pragma - mark 素材图片数组懒加载
- (NSMutableArray *)imagesArrayM{
    
    if (!_imagesArrayM) {
        self.imagesArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _imagesArrayM;
}

#pragma - mark 保存所有布局属性cell懒加载
- (NSMutableArray *)layoutAttributesCellArrayM{
    
    if (!_layoutAttributesCellArrayM) {
        self.layoutAttributesCellArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _layoutAttributesCellArrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpImageCollectionFlowLayout];
    
    for (int i = 0; i < 12; i++) {
        [self.imagesArrayM addObject:[NSString stringWithFormat:@"%d",i+1]];
    }
}

#pragma - mark 初始化imageCollection的流水布局
- (void)setUpImageCollectionFlowLayout{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5.0;
    layout.minimumInteritemSpacing = 5.0;
    layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    
    // 初始化imageCollection
    [self setUpImageCollection:layout];
}

#pragma - mark 初始化imageCollection
- (void)setUpImageCollection:(UICollectionViewFlowLayout *)layout{
    
    _reorderingCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64.0, HQYScreenWidth, HQYScreenHeight) collectionViewLayout:layout];
    _reorderingCollectionView.backgroundColor = [UIColor lightGrayColor];
    _reorderingCollectionView.dataSource = self;
    _reorderingCollectionView.delegate = self;
    [_reorderingCollectionView registerClass:[HQYReorderingCell class] forCellWithReuseIdentifier:HQYReorderingControllerID];
    [self.view addSubview:_reorderingCollectionView];
}

#pragma - mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.imagesArrayM.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((HQYScreenWidth - 25.0) / 3.0, (HQYScreenWidth - 25.0) / 3.0 * 5 / 3);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HQYReorderingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HQYReorderingControllerID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellImageView.image = [UIImage imageNamed:self.imagesArrayM[indexPath.row]];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    [cell addGestureRecognizer:longPress];
    return cell;
}

#pragma - mark 添加长按手势
- (void)longPressGesture:(UILongPressGestureRecognizer *)sender{
    
    HQYReorderingCell *cell = (HQYReorderingCell *)sender.view;
    NSIndexPath *cellIndexPath = [_reorderingCollectionView indexPathForCell:cell];
    [_reorderingCollectionView bringSubviewToFront:cell];
    
    BOOL isChanged = NO;
    
    switch (sender.state) {
            
        case UIGestureRecognizerStateBegan:
            [self.layoutAttributesCellArrayM removeAllObjects];
            for (int i = 0;i< self.imagesArrayM.count; i++) {
                [self.layoutAttributesCellArrayM addObject:[_reorderingCollectionView layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
            }
            break;
            
        case UIGestureRecognizerStateChanged:
            cell.center = [sender locationInView:_reorderingCollectionView];
            for (UICollectionViewLayoutAttributes *attributes in self.layoutAttributesCellArrayM) {
                if (CGRectContainsPoint(attributes.frame, cell.center) && cellIndexPath != attributes.indexPath) {
                    isChanged = YES;
                    NSString *imageStr = self.imagesArrayM[cellIndexPath.row];
                    [self.imagesArrayM removeObjectAtIndex:cellIndexPath.row];
                    [self.imagesArrayM insertObject:imageStr atIndex:attributes.indexPath.row];
                    [self.reorderingCollectionView moveItemAtIndexPath:cellIndexPath
                                                 toIndexPath:attributes.indexPath];
                }
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            if (!isChanged) {
                cell.center = [_reorderingCollectionView layoutAttributesForItemAtIndexPath:cellIndexPath].center;
            }
            break;
            // 消除警告用,因为sender.state的其他几种状态未做判断
        default:
            
            break;
    }
}

@end
