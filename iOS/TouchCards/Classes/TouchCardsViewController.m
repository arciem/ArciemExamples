#import "TouchCardsViewController.h"

@interface TouchCardsViewController ()

@property(strong, nonatomic) NSMutableArray* cardViews;

@end

@implementation TouchCardsViewController

@synthesize cardViews;

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	NSArray* frontNames = [NSArray arrayWithObjects:
						   @"AceOfSpades",
						   @"ElevenOfDiamonds",
						   @"KingOfClubs",
						   @"QueenOfDiamonds",
						   @"JackOfSpades",
						   nil];
	
	self.cardViews = [NSMutableArray array];

	CGFloat x = 20;
	UIImage* backImage = [UIImage imageNamed:@"CardBack"];
	CGSize size = backImage.size;
	size.width /= 2;
	size.height /= 2;
	for(NSString* frontImageName in frontNames) {
		CGRect frame = CGRectMake(x, x, size.width, size.height);
		UIImage* frontImage = [UIImage imageNamed:frontImageName];
		CardView* cardView = [[CardView alloc] initWithFrame:frame frontImage:frontImage backImage:backImage];
		cardView.backgroundColor = [UIColor clearColor];
		cardView.delegate = self;
		[self.view addSubview:cardView];
		[self.cardViews addObject:cardView];
		
		x += 20;
	}
}

- (void)cardViewWasTouched:(CardView*)cardView
{
//	NSLog(@"%@ cardViewWasTouched:%@", self, cardView);
}

@end
