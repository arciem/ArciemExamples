#import "FaveButton.h"
#import "UIImageUtils.h"
#import "UIColorUtils.h"

@interface FaveButton ()

@property(nonatomic, strong) UIColor* internalTintColor;

@end

@implementation FaveButton

@synthesize onLightBackground = onLightBackground_;
@synthesize internalTintColor = internalTintColor_;

- (void)setup
{
	self.opaque = NO;
	self.backgroundColor = [UIColor clearColor];
	self.contentMode = UIViewContentModeCenter;
	self.adjustsImageWhenHighlighted = NO;
	self.showsTouchWhenHighlighted = YES;
	self.tintColor = [UIColor grayColor];
//	self.tintColor = [[UINavigationBar appearance] tintColor];
	
	[self addObserver:self forKeyPath:@"tintColor" options:0 context:nil];
	[self addObserver:self forKeyPath:@"onLightBackground" options:NSKeyValueObservingOptionInitial context:nil];
	[self addTarget:self action:@selector(touched) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc
{
	[self removeObserver:self forKeyPath:@"tintColor"];
	[self removeObserver:self forKeyPath:@"onLightBackground"];
}

- (void)syncToBackground
{
	UIImage* onImage = [UIImage imageNamed:@"FaveStarOn"];
	[self setImage:onImage forState:UIControlStateSelected];

	UIColor* tintColor = [[self.tintColor colorByColorBurnFraction:0.2] colorByDarkeningFraction:0.05];
	UIImage* shapeImage = [UIImage imageNamed:@"FaveStarOffShape"];
	UIImage* offImage = [UIImage etchedImageWithShapeImage:shapeImage tintColor:tintColor glossAlpha:1.0];
	[self setImage:offImage forState:UIControlStateNormal];
	
	[self sizeToFit];
}

- (UIColor*)tintColor
{
	return self.internalTintColor;
}

- (void)setTintColor:(UIColor*)tintColor
{
	self.internalTintColor = tintColor;
	[self syncToBackground];
}

- (void)awakeFromNib
{
	[self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if(object == self) {
		if([keyPath isEqualToString:@"onLightBackground"]) {
			[self syncToBackground];
		}
	}
}

- (void)touched
{
	self.selected = !self.selected;
}

@end
