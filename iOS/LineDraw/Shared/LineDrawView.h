#import <UIKit/UIKit.h>

@class Shape;

@interface LineDrawView : UIView {
	@private
	NSMutableArray* shapes;
	Shape* currentShape;
}

- (IBAction)clear;
- (IBAction)clearLastShape;
- (IBAction)clearLastPoint;

@end
