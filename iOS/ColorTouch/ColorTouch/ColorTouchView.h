#import <UIKit/UIKit.h>

@class ColorTouchView;

@protocol ColorTouchViewDelegate <NSObject>

@required
- (void)colorTouchView:(ColorTouchView*)view didTapRegion:(id)regionID containingColor:(UIColor*)color;

@end

@interface ColorTouchView : UIView

@property(strong, nonatomic) UIImage* visibleImage;
@property(strong, nonatomic) UIImage* colorMapImage;
@property(strong, nonatomic) NSDictionary* colorMappings;
@property(weak, nonatomic) id<ColorTouchViewDelegate> delegate;

@end
