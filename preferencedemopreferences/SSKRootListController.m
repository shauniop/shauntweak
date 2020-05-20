#include "SSKRootListController.h"

@implementation SSKRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)openGithub{
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/shauniop"]
	options:@{}
	completionHandler:nil];
}

@end
