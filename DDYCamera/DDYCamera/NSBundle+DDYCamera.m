/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - NSBundle+DDYCamera.m

#import "NSBundle+DDYCamera.h"
#import "DDYCameraManager.h"

@implementation NSBundle (DDYCamera)

+ (NSBundle *)ddyCameraBundle {
    NSBundle *bundle = [NSBundle bundleForClass:[DDYCameraManager class]];
    return [NSBundle bundleWithURL:[bundle URLForResource:@"DDYCamera" withExtension:@"bundle"]];
}

+ (NSString *)ddyCameraBundleLocalizedStringForKey:(NSString *)key {
    return [self ddyCameraBundleLocalizedStringForKey:key value:@""];
}

+ (NSString *)ddyCameraBundleLocalizedStringForKey:(NSString *)key value:(NSString *)value {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"DDYLanguages"];
    if (!language) {
        language = [NSLocale preferredLanguages].firstObject;
    }
    if (!language) {
        language = @"zh-Hans";
    } else if ([language hasPrefix:@"zh"]) {
        language = @"zh-Hans";
    } else {
        language = @"en";
    }
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle ddyCameraBundle] pathForResource:language ofType:@"lproj"]];
    if (bundle) {
        // 如果默认Localizable.strings则nil，这里命名DDYAuthManager.strings
        value =  [bundle localizedStringForKey:key value:value table:@"DDYCamera"];
    }
    // (如果拖入工程)可以在[NSBundle mainBundle]查找，如果没有则返回原key
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

+ (UIImage *)ddyCameraBundleImage:(NSString *)imageName {
    return [UIImage imageWithContentsOfFile:[[NSBundle ddyCameraBundle] pathForResource:imageName ofType:@"png"]];
}


@end
