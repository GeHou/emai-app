//
//  ViewController.m
//  Demo
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "ShareViewController.h"
#import "CHTCollectionViewWaterfallCell.h"

#define CELL_WIDTH 129
#define CELL_COUNT 30000
#define CELL_IDENTIFIER @"WaterfallCell"

@interface ShareViewController ()
@property (nonatomic, strong) NSMutableArray *cellHeights;
@end

@implementation ShareViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		self.cellWidth = CELL_WIDTH;        // Default if not setting runtime attribute
	}
	return self;
}

#pragma mark - Accessors
- (UICollectionView *)collectionView {
	if (!_shareCollectionView) {
		CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
		layout.sectionInset = UIEdgeInsetsMake(9, 9, 9, 9);
		layout.delegate = self;
        
		_shareCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
		_shareCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_shareCollectionView.dataSource = self;
		_shareCollectionView.delegate = self;
		_shareCollectionView.backgroundColor = [UIColor whiteColor];
		[_shareCollectionView registerClass:[CHTCollectionViewWaterfallCell class]
		    forCellWithReuseIdentifier:CELL_IDENTIFIER];
	}
	return _shareCollectionView;
}

- (NSMutableArray *)cellHeights {
	if (!_cellHeights) {
		_cellHeights = [NSMutableArray arrayWithCapacity:CELL_COUNT];
		for (NSInteger i = 0; i < CELL_COUNT; i++) {
			_cellHeights[i] = @(arc4random() % 100 * 2 + 100);
		}
	}
	return _cellHeights;
}

#pragma mark - Life Cycle
- (void)dealloc {
	[_shareCollectionView removeFromSuperview];
	_shareCollectionView = nil;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview:self.collectionView];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self updateLayout];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
	[super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation
	                                        duration:duration];
	[self updateLayout];
}

- (void)updateLayout {
	CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
//	layout.columnCount = self.collectionView.bounds.size.width / self.cellWidth;
//	layout.itemWidth = self.cellWidth;
    layout.columnCount = 2;
    layout.itemWidth = 146.0f;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return CELL_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	CHTCollectionViewWaterfallCell *cell =
    (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                                forIndexPath:indexPath];
    
//	cell.displayString = [NSString stringWithFormat:@"%d", indexPath.row];
	return cell;
}

#pragma mark - UICollectionViewWaterfallLayoutDelegate
- (CGFloat)   collectionView:(UICollectionView *)collectionView
                      layout:(CHTCollectionViewWaterfallLayout *)collectionViewLayout
    heightForItemAtIndexPath:(NSIndexPath *)indexPath {
	return [self.cellHeights[indexPath.item] floatValue];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select");
}

@end
