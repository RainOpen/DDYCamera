/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - 用于自定义bundle资源加载(比如国际化文件、图片等)

#import <UIKit/UIKit.h>

@interface NSBundle (DDYCamera)

+ (NSBundle *)ddyCameraBundle;

+ (NSString *)ddyCameraBundleLocalizedStringForKey:(NSString *)key;

+ (NSString *)ddyCameraBundleLocalizedStringForKey:(NSString *)key value:(NSString *)value;

+ (UIImage *)ddyCameraBundleImage:(NSString *)imageName;

@end
