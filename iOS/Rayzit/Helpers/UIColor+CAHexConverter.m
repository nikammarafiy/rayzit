/**
 * Copyright (c) 2016 Data Management Systems Laboratory, University of Cyprus
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **/

//
//  UIColor+CAHexConverter.m
//  FunifiDO
//
//  Created by Chrysovalantis Anastasiou on 17/6/14.
//  Copyright (c) 2014 Funifi LTD. All rights reserved.
//

#import "UIColor+CAHexConverter.h"

@implementation UIColor (CAHexConverter)

// strings
+ (UIColor *)colorWithHexString:(NSString *)str {
    if (!str || [str isEqualToString:@""]) {
        str = @"#000000";
    }
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x;
    if (cStr[0] == '#') {
        x = strtol(cStr+1, NULL, 16);
    }
    else {
        x = strtol(cStr, NULL, 16);
    }
    
    return [UIColor colorWithHex:x];
}

// hexadecimal numbers
+ (UIColor *)colorWithHex:(long)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

@end
