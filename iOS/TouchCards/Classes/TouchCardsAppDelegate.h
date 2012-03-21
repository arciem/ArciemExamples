#import <UIKit/UIKit.h>

@class TouchCardsViewController;

@interface TouchCardsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchCardsViewController *viewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet TouchCardsViewController *viewController;

@end

