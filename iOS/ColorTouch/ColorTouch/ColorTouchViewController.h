#import <UIKit/UIKit.h>
#import "ColorTouchView.h"

@interface ColorTouchViewController : UIViewController<ColorTouchViewDelegate>

@property(strong, nonatomic) IBOutlet ColorTouchView* colorTouchView;
@property(strong, nonatomic) IBOutlet UISwitch* switchControl;
@property(strong, nonatomic) IBOutlet UILabel* label;

- (IBAction)switchChanged;

@end
