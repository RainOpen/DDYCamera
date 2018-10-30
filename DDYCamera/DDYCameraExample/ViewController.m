#import "ViewController.h"
#import "DDYCamera.h"
#import "DDYVideoPlayer.h"

#ifndef DDYTopH
#define DDYTopH (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height)
#endif

#ifndef DDYScreenW
#define DDYScreenW [UIScreen mainScreen].bounds.size.width
#endif

#ifndef DDYScreenH
#define DDYScreenH [UIScreen mainScreen].bounds.size.height
#endif

@interface ViewController ()

@property (nonatomic, strong) UIButton *takeButton;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) DDYVideoPlayer *player;

@end

@implementation ViewController

- (UIButton *)takeButton {
    if (!_takeButton) {
        _takeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_takeButton setTitle:@"Take Photos Or Record Video" forState:UIControlStateNormal];
        [_takeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_takeButton setBackgroundColor:[UIColor lightGrayColor]];
        [_takeButton addTarget:self action:@selector(handleTake) forControlEvents:UIControlEventTouchUpInside];
        [_takeButton setFrame:CGRectMake(15, DDYTopH + 10, DDYScreenW-30, 30)];
    }
    return _takeButton;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, DDYTopH + 50, (DDYScreenW-45)/2., (DDYScreenW-45)*DDYScreenH/2./DDYScreenW)];
    }
    return _imageView;
}

- (DDYVideoPlayer *)player {
    if (!_player) {
        _player = [[DDYVideoPlayer alloc] initWithFrame:CGRectMake(15+(DDYScreenW-45)/2.+15,  DDYTopH + 50, (DDYScreenW-45)/2., (DDYScreenW-45)*DDYScreenH/2./DDYScreenW)];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.takeButton];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.player];
}

- (void)handleTake {
    
    __weak __typeof (self)weakSelf = self;
    [DDYCameraManager ddy_CameraAuthSuccess:^{
        [DDYCameraManager ddy_MicrophoneAuthSuccess:^{
            DDYCameraController *cameraVC = [[DDYCameraController alloc] init];
            [cameraVC setTakePhotoBlock:^(UIImage *image, UIViewController *vc) {
                __strong __typeof (weakSelf)strongSelf = weakSelf;
                strongSelf.imageView.image = image;
                [vc dismissViewControllerAnimated:YES completion:^{ }];
            }];
            [cameraVC setRecordVideoBlock:^(NSURL *videoURL, UIViewController *vc) {
                __strong __typeof (weakSelf)strongSelf = weakSelf;
                [strongSelf.player playWithPath:videoURL.absoluteString];
                [vc dismissViewControllerAnimated:YES completion:^{ }];
            }];
            [self presentViewController:cameraVC animated:YES completion:^{ }];
        } fail:^{NSLog(@"麦克风权限未开启");}];
    } fail:^{NSLog(@"相机权限未开启");}];
}

@end
