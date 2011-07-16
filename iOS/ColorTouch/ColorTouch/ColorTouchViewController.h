#import <UIKit/UIKit.h>
#import "ColorTouchView.h"

@interface ColorTouchViewController : UIViewController<ColorTouchViewDelegate>

@property(nonatomic, retain) IBOutlet ColorTouchView* colorTouchView;
@property(nonatomic, retain) IBOutlet UISwitch* switchControl;
@property(nonatomic, retain) IBOutlet UILabel* label;

- (IBAction)switchChanged;

@end
