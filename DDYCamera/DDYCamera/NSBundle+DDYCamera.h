/** MARK: - DDYAuthManager 2018/10/30
 *  !!!: Author: 豆电雨
 *  !!!: QQ/WX:  634778311
 *  !!!: Github: https://github.com/RainOpen/
 *  !!!: Blog:   https://www.jianshu.com/u/a4bc2516e9e5
 *  MARK: - 用于自定义bundle资源加载(比如国际化文件、图片等)
 */

#import <UIKit/UIKit.h>

@interface NSBundle (DDYCamera)

+ (NSBundle *)ddyCameraBundle;

+ (NSString *)ddyLocalizedStringForKey:(NSString *)key;

+ (NSString *)ddyLocalizedStringForKey:(NSString *)key value:(NSString *)value;

+ (UIImage *)ddyImage:(NSString *)imageName;

@end
