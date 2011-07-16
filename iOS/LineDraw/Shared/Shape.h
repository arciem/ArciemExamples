#import <Foundation/Foundation.h>


@interface Shape : NSObject

@property(nonatomic, getter = isClosed) BOOL closed;

- (void)draw;
- (void)addPoint:(CGPoint)p;
- (BOOL)removePoint;

@end
