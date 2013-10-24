//
//  LollerPlugin.m
//  Loller
//
//  Created by Chris Sinchok on 10/11/13.
//  Copyright (c) 2013 The Onion. All rights reserved.
//

#import "LollerPlugin.h"

@implementation LollerPlugin
@synthesize laughPaths;

- (void) laugh {
    NSUInteger randomIndex = arc4random() % [self.laughPaths count];
    NSSound *laugh = [[NSSound alloc] initWithContentsOfFile: [self.laughPaths objectAtIndex:randomIndex] byReference:YES];
    [laugh play];
}

- (void) gotMessage:(NSNotification *) notification {
    id contentMessage = [notification.userInfo objectForKey:@"AIContentObject"];
    NSAttributedString *message = (NSAttributedString *)[contentMessage message];
    if ([[[message string] lowercaseString] rangeOfString:@"lol"].location != NSNotFound) {
        [self laugh];
        return;
    }
    if ([[[message string] lowercaseString] rangeOfString:@"rofl"].location != NSNotFound) {
        [self laugh];
        return;
    }
    if ([[[message string] lowercaseString] rangeOfString:@"hah"].location != NSNotFound) {
        [self laugh];
        return;
    }
    if ([[[message string] lowercaseString] rangeOfString:@"heh"].location != NSNotFound) {
        [self laugh];
        return;
    }
}

- (void) installPlugin
{
    self.laughPaths = [[NSBundle bundleForClass:self.class] pathsForResourcesOfType:@"mp3" inDirectory:@"laughs"];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(gotMessage:) name:CONTENT_MESSAGE_RECEIVED object:nil];
    [notificationCenter addObserver:self selector:@selector(gotMessage:) name:CONTENT_MESSAGE_RECEIVED_GROUP object:nil];
}

- (void) uninstallPlugin
{
    NSLog(@"Uninstalling...");
}

@end
