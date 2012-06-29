//
//  XGTopicTagCell.m
//  Titan
//
//  Created by admin on 6/27/12.
//  Copyright (c) 2012 xianguo.com. All rights reserved.
//

#import "SGPMenuCell.h"

@implementation SGPMenuCell

@synthesize titleLabel;
@synthesize bottomLine;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        CGFloat lineHeight = 4;
        
        self.titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height-lineHeight)] autorelease];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.bottomLine = [[[UIView alloc] initWithFrame:CGRectMake(0, height-lineHeight, width, lineHeight)] autorelease];
        self.bottomLine.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.bottomLine];
        self.bottomLine.hidden = YES;
    }
    return self;
}

- (void)dealloc {
    [titleLabel release];
    [bottomLine release];
    
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

@end
