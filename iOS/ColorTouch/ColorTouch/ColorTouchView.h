//
//  ColorTouchView.h
//  ColorTouch
//
//  Created by Robert McNally on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorTouchView;

@protocol ColorTouchViewDelegate <NSObject>

@required
- (void)colorTouchView:(ColorTouchView*)view didTapRegion:(id)regionID containingColor:(UIColor*)color;

@end

@interface ColorTouchView : UIView

@property(nonatomic, retain) UIImage* visibleImage;
@property(nonatomic, retain) UIImage* colorMapImage;
@property(nonatomic, retain) NSDictionary* colorMappings;
@property(nonatomic, assign) id<ColorTouchViewDelegate> delegate;

@end
