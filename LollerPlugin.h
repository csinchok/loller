//
//  LollerPlugin.h
//  Loller
//
//  Created by Chris Sinchok on 10/11/13.
//  Copyright (c) 2013 The Onion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Adium/AIPlugin.h>

@interface LollerPlugin :  NSObject <AIPlugin>

@property (nonatomic, retain) NSArray *laughPaths;

@end