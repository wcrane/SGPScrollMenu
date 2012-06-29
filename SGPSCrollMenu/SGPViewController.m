//
//  SGPViewController.m
//  SGPSCrollMenu
//
//  Created by admin on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SGPViewController.h"
#import "SGPMenuCell.h"

@interface SGPViewController ()

@end

@implementation SGPViewController

@synthesize menuView;
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.menuView = [[[SGPScrollMenuView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
    [self.view addSubview:self.menuView];
    self.menuView.delegate = self;
    self.menuView.dataSource = self;
    self.menuView.backgroundColor = [UIColor blueColor];
    
    self.label.text = [NSString stringWithFormat:@"Index: %d", _curIndex];
    [self.menuView reloadData];
}

- (void)dealloc {
    [menuView release];
    [label release];
    
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    self.menuView = nil;
    self.label = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - SGPScrollMenuDelegate
- (NSUInteger)numberOfItemInScrollMenu:(SGPScrollMenuView *)menu {
    return 4;
}

//no reuse,can custom cell
- (SGPMenuCell *)scrollMenu:(SGPScrollMenuView *)menu cellForIndex:(NSInteger)index {
    SGPMenuCell *cell = [[[SGPMenuCell alloc] initWithFrame:CGRectMake(0, 0, 106, 44)] autorelease];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Title: %d", index];
    
    if (_curIndex == index) {
        cell.bottomLine.hidden = NO;
    }else {
        cell.bottomLine.hidden = YES;
    }
    
    return cell;
}

//Optional, default is (106,44)
- (CGSize)scrollMenu:(SGPScrollMenuView *)menu cellSizeForIndex:(NSInteger)index {
    return CGSizeMake(106, 44);
}

- (void)scrollMenu:(SGPScrollMenuView *)menu didSelectIndex:(NSInteger)index {
    _curIndex = index;
    [menu reloadData];
    
    self.label.text = [NSString stringWithFormat:@"Index: %d", _curIndex];
}
@end
