/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - 相机管理器

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DDYCameraManager : NSObject

/// 视屏格式 默认 AVFileTypeMPEG4
@property (nonatomic, strong) AVFileType videoType;
/// 拍照回调
@property (nonatomic, copy) void (^takeFinishBlock)(UIImage *image);
/// 录制回调
@property (nonatomic, copy) void (^recordFinishBlock)(NSURL *videoURL);
/// 光强检测
@property (nonatomic, copy) void (^brightnessValueBlock)(CGFloat brightnessValue);
/// 会话质量 默认AVCaptureSessionPresetHigh
@property (nonatomic, copy) NSString *sessionPreset;

/// 相机使用权限鉴定 (推荐使用DDYAuthManager统一管理)
/// @param success 有授权回调
/// @param fail 无权限回调
+ (void)ddy_CameraAuthSuccess:(void (^)(void))success fail:(void (^)(void))fail;

/// 麦克风使用权限鉴定 (推荐使用DDYAuthManager统一管理 )
/// @param success 有授权回调
/// @param fail 无权限回调
+ (void)ddy_MicrophoneAuthSuccess:(void (^)(void))success fail:(void (^)(void))fail;

/// 初始化
/// @param view 传入要要容纳预览layer层的视图
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

@end
