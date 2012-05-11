//
//  FirstModel.h
//  RotationExample
//
//  Created by Robert McNally on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondModel.h"

@interface FirstModel : NSObject

@property (copy, nonatomic) NSString* text;
@property (strong, nonatomic) SecondModel* secondModel;

@end
