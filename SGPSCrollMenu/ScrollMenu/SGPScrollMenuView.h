//
//  SGPTopicTagsView.h
//  Titan
//
//  Created by admin on 6/27/12.
//  Copyright (c) 2012 xianguo.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SGPMenuCell;
@class SGPScrollMenuView;

@protocol SGPScrollMenuViewDataSource <NSObject>
@required
- (NSUInteger)numberOfItemInScrollMenu:(SGPScrollMenuView *)menu;
- (SGPMenuCell *)scrollMenu:(SGPScrollMenuView *)menu cellForIndex:(NSInteger)index;

@optional
- (CGSize)scrollMenu:(SGPScrollMenuView *)menu cellSizeForIndex:(NSInteger)index;
@end

@protocol SGPScrollMenuViewDelegate <NSObject>
@optional
- (void)scrollMenu:(SGPScrollMenuView *)menu didSelectIndex:(NSInteger)index;
@end

@interface SGPScrollMenuView : UIView {
    UIScrollView    *scrollView;
    
    id<SGPScrollMenuViewDelegate>    delegate;
    id<SGPScrollMenuViewDataSource>  dataSource;
    
    NSUInteger _curIndex;
    SGPMenuCell *_curCell;
}
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, assign) id<SGPScrollMenuViewDelegate>      delegate;
@property (nonatomic, assign) id<SGPScrollMenuViewDataSource>    dataSource;

- (void)reloadData;
@end
