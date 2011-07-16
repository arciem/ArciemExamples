#import <UIKit/UIKit.h>

@class TouchCardsViewController;

@interface TouchCardsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchCardsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchCardsViewController *viewController;

@end

