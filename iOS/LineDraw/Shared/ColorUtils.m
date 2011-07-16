#import "ColorUtils.h"

UIColor* randomColor()
{
	CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX; 
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX; 
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX; 
	
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}