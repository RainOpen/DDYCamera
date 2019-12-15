/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - 内置相机控制器(如果UI没任何要求时可以用)

#import <UIKit/UIKit.h>

@interface DDYCameraController : UIViewController
/// 拍照回调
@property (nonatomic, copy) void (^takePhotoBlock)(UIImage *image, UIViewController *vc);
/// 录制回调
@property (nonatomic, copy) void (^recordVideoBlock)(NSURL *videoURL, UIViewController *vc);

@end
