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
//  ApiRayz.m
//  Rayzit
//
//  Created by Chrysovalantis Anastasiou on 25/9/14.
//  Copyright (c) 2014 DMSL. All rights reserved.
//

#import "ApiRayz.h"

#import "Rayz.h"
#import "Attachments.h"
#import "RayzRequests.h"

@implementation ApiRayz

+ (ApiRayz *)apiRayzFromRayz:(Rayz *)rayz {
    ApiRayz *apiRayz = [[ApiRayz alloc] init];
    
    [apiRayz setRayz_message:[rayz rayz_message]];
    [apiRayz setUserId:[rayz userId]];
    [apiRayz setMaxDistance:[[rayz maxDistance] integerValue]];
    [apiRayz setLatitude:[[[User appUser] latitude] floatValue]];
    [apiRayz setLongitude:[[[User appUser] longitude] floatValue]];
    [apiRayz setAccuracy:[[[User appUser] accuracy] floatValue]];
    [apiRayz setAttachments:[[rayz attachments] allAttachments]];
    
    return apiRayz;
}

#pragma mark Mappings
+ (RKObjectMapping *)objectMapping {
    RKObjectMapping * mapping = [RKObjectMapping requestMapping];
    
    [mapping addAttributeMappingsFromArray:@[@"userId",@"latitude",@"longitude",@"accuracy",@"maxDistance"]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"rayz_message":@"rayzMessage"
                                                  }];
    
    return mapping;
}

@end
