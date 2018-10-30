/** MARK: - DDYAuthManager 2018/10/30
 *  !!!: Author: 豆电雨
 *  !!!: QQ/WX:  634778311
 *  !!!: Github: https://github.com/RainOpen/
 *  !!!: Blog:   https://www.jianshu.com/u/a4bc2516e9e5
 *  MARK: - NSBundle+DDYCamera.m
 */

#import "NSBundle+DDYCamera.h"
#import "DDYCameraManager.h"

@implementation NSBundle (DDYCamera)

+ (NSBundle *)ddyCameraBundle {
    NSBundle *bundle = [NSBundle bundleForClass:[DDYCameraManager class]];
    return [NSBundle bundleWithURL:[bundle URLForResource:@"DDYCamera" withExtension:@"bundle"]];
}

+ (NSString *)ddyLocalizedStringForKey:(NSString *)key {
    return [self ddyLocalizedStringForKey:key value:@""];
}

+ (NSString *)ddyLocalizedStringForKey:(NSString *)key value:(NSString *)value {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"DDYLanguages"];
    if (!language) language = [NSLocale preferredLanguages].firstObject;
    if ([language containsString:@"zh-Hans"]) {
        language = @"zh-Hans";
    } else {
        language = @"en";
    }
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle ddyCameraBundle] pathForResource:language ofType:@"lproj"]];
    return [bundle localizedStringForKey:key value:value table:@"DDYCamera"];
}

+ (UIImage *)ddyImage:(NSString *)imageName {
    return [UIImage imageWithContentsOfFile:[[NSBundle ddyCameraBundle] pathForResource:imageName ofType:@"png"]];
}


@end
