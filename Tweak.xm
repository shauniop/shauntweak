#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/your_bundle_identifier.bundle"

#import "UIColor.h"

@interface CSCoverSheetViewController : UIViewController
@end
%hook CSCoverSheetViewController
- (void)viewDidLoad {
	%orig;
	UIView *rectView = [[UIView alloc] initWithFrame:CGRectMake(0,0,40,40)];
	NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
	NSString *imagePath = [bundle pathForResource:@"img" ofType:@"png"];
	UIImage *starImage = [UIImage imageWithContentsOfFile:imagePath];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:starImage];
	imageView.frame = rectView.bounds;
	[rectView addSubview:imageView];
	[self.view addSubview:rectView];

	UILabel *redRectangle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 40)];
	[redRectangle setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]]; 
	[redRectangle setBackgroundColor:[UIColor redColor]];;
	[self.view addSubview:redRectangle];
	NSString *hackString = @"Hacked by /u/shauniop";
	redRectangle.text = hackString;
}
%end

@interface CCUIRoundButton : UIControl
@property(nonatomic, retain)UIView* selectedStateBackgroundView;
-(id)_viewControllerForAncestor;
+ (UIColor *)UIColorFromRGB;
@end


%hook CCUIRoundButton

-(void)layoutSubviews {
	%orig;

	UIViewController *controller = [self _viewControllerForAncestor];
	UIView *backgroundView = self.selectedStateBackgroundView;

	//NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.shauniop.CCXpreferences"];
    //id isEnabled = [bundleDefaults valueForKey:@"isEnabled"];

	//UIColor *toggleColor = nil;
	NSString *toggleColor = nil;
	if ([controller isMemberOfClass:%c(CCUIConnectivityBluetoothViewController)]) {
		//toggleColor = [UIColor colorWithRed: 0.00 green: 1.00 blue: 0.00 alpha: 1.00];
		toggleColor = @"#00FF00";


	}else if([controller isMemberOfClass:%c(CCUIConnectivityWifiViewController)]) {
		//toggleColor = [UIColor colorWithRed: 1.00 green: 0.00 blue: 0.00 alpha: 1.00];
		toggleColor = @"#FF0000";


	}

	if (toggleColor == nil) return;

	[backgroundView setBackgroundColor:[UIColor RGBAColorFromHexString:toggleColor]];
}
%end

