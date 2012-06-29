//
//  SGPTopicTagsView.m
//  Titan
//
//  Created by admin on 6/27/12.
//  Copyright (c) 2012 xianguo.com. All rights reserved.
//

#import "SGPScrollMenuView.h"
#import "SGPMenuCell.h"

//三分之一屏，默认Cell大小
#define kDefaultCellSize CGSizeMake(106,44)

@implementation SGPScrollMenuView

@synthesize scrollView;
@synthesize delegate;
@synthesize dataSource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[[UIScrollView alloc] initWithFrame:self.bounds] autorelease];
        self.scrollView.scrollEnabled = YES;
        self.scrollView.clipsToBounds = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        _curIndex = 0;
        _curCell = nil;
    }
    return self;
}

- (void)dealloc{
    [scrollView release];
    scrollView = nil;
    
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)scrollToSelect
{
    if (_curCell) {
        int x = _curCell.center.x - self.frame.size.width / 2;
        [scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    }
}

- (void)reloadData {
    if(scrollView.subviews && scrollView.subviews.count > 0) {
		[scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	}
	
	if(!self.dataSource) {
		return;
	}
	
	int count;
	
	if((count = [self.dataSource numberOfItemInScrollMenu:self]) == 0) {
		return;
	}
	
	int index;
	
	float origin_x = 0;
	for(index=0; index<count; index++) {
		SGPMenuCell* cell = (SGPMenuCell *)[self.dataSource scrollMenu:self cellForIndex:index];
        cell.tag = index;
		
		[cell addTarget:self action:@selector(cellClicked:) forControlEvents:UIControlEventTouchUpInside];
		
        CGSize size = CGSizeZero;
		if (self.dataSource && [self.dataSource respondsToSelector:@selector(scrollMenu:cellSizeForIndex:)]) {
            size = [self.dataSource scrollMenu:self cellSizeForIndex:index];
            cell.frame = CGRectMake(origin_x, 0, size.width, size.height);
        }
        
		origin_x += size.width;
		
		[scrollView addSubview:cell];
	}
	
	scrollView.contentSize = CGSizeMake(origin_x, 43.0f);
    
    if (scrollView.contentSize.width > self.frame.size.width) {
        [self scrollToSelect];
    }
}

- (void)cellClicked:(id)sender {
    SGPMenuCell *cell = (SGPMenuCell *)sender;
    _curCell = cell;
    _curIndex = cell.tag;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollMenu:didSelectIndex:)]) {
        [self.delegate scrollMenu:self didSelectIndex:cell.tag];
    }
}
@end
