//
//  TwoDDecoderResult.m
//  ZXing
//
//  Created by Christian Brunschen on 04/06/2008.
/*
 * Copyright 2008 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "TwoDDecoderResult.h"


@implementation TwoDDecoderResult

@synthesize text;
@synthesize points;
@synthesize format;

+ (id)resultWithText:(NSString *)text points:(NSArray *)points format:(NSString*)format;{
  return [[[self alloc] initWithText:text points:points format: format] autorelease];
}

- (id)initWithText:(NSString *)t points:(NSArray *)p format:(NSString*)f; {
  if ((self = [super init]) != nil) {
    self.text = t;
    self.points = p;
      self.format = f;
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone {
    NSArray* newPoints = [[self.points copy] autorelease];
    NSString* newText = [[self.text copy] autorelease];
    NSString* newFormat = [[self.format copy] autorelease];
    
    return [[TwoDDecoderResult allocWithZone:zone] initWithText:newText points:newPoints format: newFormat];
}

- (id)copy {
  return [self copyWithZone:nil];
}

- (void)dealloc {
  [text release];
  [points release];
    [format release];
  [super dealloc];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"<%@: %p> %@ - %@", [self class], self, self.text, self.format];
}

@end
