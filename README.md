# DDYCamera

相机的封装，能够拍摄图片和录制视频，可以利用现成的控制器，也可以用DDYCameraManager加自定义UI


 ![DDYCamera.jpg](https://github.com/starainDou/DDYDemoImage/blob/master/DDYCamera.jpg) 

> # 集成

* CocoaPods方式 

  1.pod 'DDYCamera', '~> 1.3.0' 
 
  2.#import <DDYCamera.h>

  [使用方案](https://github.com/starainDou/DDYCamera)

* 文件夹拖入工程方式
  
  1.下载工程解压后将'DDYCamera'文件夹拖到工程中

  2.#import "DDYCamera.h"

> # 权限

* plist配置

从下面代码中copy你想要的(也可以全部copy)

```
 <!-- 权限配置 -->
 <key>NSAppleMusicUsageDescription</key>
 <string>App需要您的同意，才能访问媒体资料库，是否同意？</string>
 <key>NSBluetoothPeripheralUsageDescription</key>
 <string>App需要您的同意，才能访问蓝牙，是否同意？</string>
 <key>NSCalendarsUsageDescription</key>
 <string>App需要您的同意，才能访问日历，是否同意？</string>
 <key>NSCameraUsageDescription</key>
 <string>App需要您的同意，才能使用相机，是否同意？</string>
 <key>NSContactsUsageDescription</key>
 <string>App需要您的同意，才能使用通讯录，是否同意？</string>
 <key>NSHealthShareUsageDescription</key>
 <string>App需要您的同意，才能访问健康分享，是否同意？</string>
 <key>NSHealthUpdateUsageDescription</key>
 <string>App需要您的同意，才能访问健康更新，是否同意？</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>App需要您的同意，才能始终访问位置</string>
 <key>NSLocationUsageDescription</key>
 <string>App需要您的同意，才能访问位置，是否同意？</string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>App需要您的同意，才能在使用期间访问位置</string>
 <key>NSMicrophoneUsageDescription</key>
 <string>App需要您的同意，才能使用麦克风，是否同意？</string>
 <key>NSMotionUsageDescription</key>
 <string>App需要您的同意，才能访问运动与健身，是否同意？</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>App需要您的同意，才能访问相册，是否同意？</string>
 <key>NSPhotoLibraryAddUsageDescription</key>
 <string>App需要您的同意，才能保存图片到相册，是否同意？</string>
 <key>NSRemindersUsageDescription</key>
 <string>App需要您的同意，才能访问提醒事项，是否同意？</string>
 <key>NSSpeechRecognitionUsageDescription</key>
 <string>App需要您的同意，才能使用语音识别，是否同意？</string>
 <key>NSFaceIDUsageDescription</key>
 <string>App需要您的同意，才能使用Face ID，是否同意？</string>
 <key>NSHomeKitUsageDescription</key>
 <string>App需要您的同意，才能使用HomeKit，是否同意？</string>
 <key>NFCReaderUsageDescription</key>
 <string>App需要您的同意，才能使用NFC，是否同意？</string>
 <key>NSSiriUsageDescription</key>
 <string>App需要您的同意，才能使用Siri，是否同意？</string>
```

* 校验

[推荐使用DDYAuthManager进行权限申请判断](https://github.com/RainOpen/DDYAuthManager)

```
// 相机权限
[DDYCameraManager ddy_CameraAuthSuccess:^{ } fail:^{NSLog(@"相机权限未开启");}];
// 麦克风权限
[DDYCameraManager ddy_MicrophoneAuthSuccess:^{ } fail:^{NSLog(@"麦克风权限未开启");}];
```

> # 使用默认控制器完成拍照、录制

默认提供了类似QQ的拍照及长按录制功能，直接用下面代码即可

```
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
```

> # 自定义UI

可以利用DDYCameraManager提供的接口完成相应功能


```
/// 初始化
+ (instancetype)ddy_CameraWithContainerView:(UIView *)view;

/// 开启捕捉会话
- (void)ddy_StartCaptureSession;

/// 停止捕捉会话
- (void)ddy_StopCaptureSession;

/// 切换摄像头
- (void)ddy_ToggleCamera;

/// 设置闪光灯模式
- (void)ddy_SetFlashMode:(AVCaptureFlashMode)flashMode;

/// 手电筒补光模式
- (void)ddy_SetTorchMode:(AVCaptureTorchMode)torchMode;

/// 聚焦/曝光
- (void)ddy_FocusAtPoint:(CGPoint)point;

/// 焦距范围 0.0-1.0
- (void)ddy_ChangeFocus:(CGFloat)focus;

/// 数码变焦 1-3倍
- (void)ddy_ChangeZoom:(CGFloat)zoom;

/// 慢动作拍摄
- (void)ddy_VideoSlow:(BOOL)isSlow;

/// 防抖模式 AVCaptureVideoStabilizationModeCinematic AVCaptureVideoStabilizationModeOff
- (void)ddy_VideoStabilizationMode:(AVCaptureVideoStabilizationMode)stabilizationMode;

/// 拍照
- (void)ddy_TakePhotos;

/// 播放系统拍照声
- (void)ddy_palySystemTakePhotoSound;

/// 开始录制视频
- (void)ddy_StartRecorder;

/// 结束录制视频
- (void)ddy_StopRecorder;

/// 录制重置
- (void)ddy_ResetRecorder;

/// 光感系数
- (void)ddy_ISO:(BOOL)isMAX;
```

