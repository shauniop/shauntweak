@interface UIColor (Magma)

+ (UIColor *)RGBAColorFromHexString:(NSString *)string;
+ (NSString *)hexStringFromColor:(UIColor *)color;
+ (UIColor *)inverseColor:(UIColor *)color;

@end
