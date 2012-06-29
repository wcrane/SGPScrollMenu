//
//  SGPViewController.h
//  SGPSCrollMenu
//
//  Created by admin on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGPScrollMenuView.h"

@interface SGPViewController : UIViewController <SGPScrollMenuViewDelegate,SGPScrollMenuViewDataSource> {
    SGPScrollMenuView *menuView;
    
    NSInteger _curIndex;
    
    UILabel *label;
}
@property (nonatomic, retain) SGPScrollMenuView *menuView;
@property (nonatomic, retain) IBOutlet UILabel *label;
@end
