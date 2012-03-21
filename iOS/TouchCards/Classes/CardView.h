#import <UIKit/UIKit.h>

@class CardView;

@protocol CardViewDelegate<NSObject>

@required
- (void)cardViewWasTouched:(CardView*)cardView;

@end

@interface CardView : UIView {

}

- (id)initWithFrame:(CGRect)frame frontImage:(UIImage*)frontImage backImage:(UIImage*)backImage;

@property(weak, nonatomic) id<CardViewDelegate> delegate;

@end
