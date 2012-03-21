#import "ColorTouchView.h"

@interface ColorTouchView ()

@property(strong, nonatomic) NSData* pixelData;
@property(nonatomic) NSUInteger bytesPerRow;
@property(nonatomic) NSUInteger bytesPerPixel;

@end

@implementation ColorTouchView

@synthesize visibleImage = visibleImage_;
@synthesize colorMapImage = colorMapImage_;
@synthesize pixelData = pixelData_;
@synthesize bytesPerRow = bytesPerRow_;
@synthesize bytesPerPixel = bytesPerPixel_;
@synthesize colorMappings = colorMappings_;
@synthesize delegate = delegate_;

- (void)drawRect:(CGRect)rect
{
	[self.visibleImage drawAtPoint:CGPointZero];
}

- (void)syncToColorMap
{
	CGImageRef imageRef = self.colorMapImage.CGImage;
	NSUInteger width = CGImageGetWidth(imageRef);
	NSUInteger height = CGImageGetHeight(imageRef);

	const NSUInteger bitsPerComponent = 8;
	self.bytesPerPixel = 4;
	self.bytesPerRow = width * self.bytesPerPixel;
	
	NSUInteger rawDataLength = height * self.bytesPerRow;
	unsigned char* rawData = malloc(rawDataLength);
	
	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, self.bytesPerRow, colorSpaceRef, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
	CGColorSpaceRelease(colorSpaceRef);
	CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
	CGContextRelease(context);
	
	self.pixelData = [NSData dataWithBytes:rawData length:rawDataLength];
	free(rawData);
}

- (UIColor*)colorAtPoint:(CGPoint)loc
{
	UIColor* result = nil;
	
	NSUInteger x = (NSUInteger)loc.x;
	NSUInteger y = (NSUInteger)loc.y;
	int offset = self.bytesPerRow * y + self.bytesPerPixel * x;
	const unsigned char* rawData = [self.pixelData bytes];
	CGFloat r = rawData[offset + 0] / 255.0;
	CGFloat g = rawData[offset + 1] / 255.0;
	CGFloat b = rawData[offset + 2] / 255.0;
	CGFloat a = rawData[offset + 3] / 255.0;
	result = [UIColor colorWithRed:r green:g blue:b alpha:a];
	
	return result;
}

- (NSUInteger)colorValueAtPoint:(CGPoint)loc
{
	NSUInteger result = 0;
	
	NSUInteger x = (NSUInteger)loc.x;
	NSUInteger y = (NSUInteger)loc.y;
	int offset = self.bytesPerRow * y + self.bytesPerPixel * x;
	const unsigned char* rawData = [self.pixelData bytes];
	NSUInteger r = rawData[offset + 0];
	NSUInteger g = rawData[offset + 1];
	NSUInteger b = rawData[offset + 2];
	NSUInteger a = rawData[offset + 3];
	result = r << 24 | g << 16 | b << 8 | a;
	
	return result;
}

- (UIImage*)visibleImage
{
	return visibleImage_;
}

- (UIImage*)colorMapImage
{
	return colorMapImage_;
}

- (void)setVisibleImage:(UIImage *)visibleImage
{
	visibleImage_ = visibleImage;
	[self setNeedsDisplay];
}

- (void)setColorMapImage:(UIImage *)colorMapImage
{
	colorMapImage_ = colorMapImage;
	[self syncToColorMap];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint loc = [[touches anyObject] locationInView:self];
	UIColor* color = [self colorAtPoint:loc];
	NSUInteger colorValue = [self colorValueAtPoint:loc];
	id mapping = [self.colorMappings objectForKey:[NSNumber numberWithUnsignedInt:colorValue]];
	NSLog(@"touch loc:%@ color:%@ colorValue:%08x mapping:%@", NSStringFromCGPoint(loc), color, colorValue, mapping);
	[self.delegate colorTouchView:self didTapRegion:mapping containingColor:color];
}

@end
