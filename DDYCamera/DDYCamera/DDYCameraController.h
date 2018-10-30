#import <UIKit/UIKit.h>

@interface DDYCameraController : UIViewController

@property (nonatomic, copy) void (^takePhotoBlock)(UIImage *image, UIViewController *vc);

@property (nonatomic, copy) void (^recordVideoBlock)(NSURL *videoURL, UIViewController *vc);

@end
