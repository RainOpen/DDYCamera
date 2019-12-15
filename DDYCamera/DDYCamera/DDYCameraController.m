/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - DDYCameraController.m

#import "DDYCameraController.h"
#import "DDYCameraManager.h"
#import "DDYCameraView.h"

@interface DDYCameraController ()
/// 相机管理器实例
@property (nonatomic, strong) DDYCameraManager *cameraManager;
/// 相机预览视图
@property (nonatomic, strong) DDYCameraView *cameraView;
/// 状态栏是否隐藏控制
@property (nonatomic, assign) BOOL statusBarHidden;

@end

@implementation DDYCameraController

///MARK: - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    __weak __typeof__ (self)weakSelf = self;
    _cameraManager = [DDYCameraManager ddy_CameraWithContainerView:self.view];
    [_cameraManager setTakeFinishBlock:^(UIImage *image) {[weakSelf handleTakeFinish:image];}];
    [_cameraManager setRecordFinishBlock:^(NSURL *videoURL) {[weakSelf handleRecordFinish:videoURL];}];
    [_cameraManager setBrightnessValueBlock:^(CGFloat brightnessValue) {
        [weakSelf handleBrightness:brightnessValue];
    }];
    
    _cameraView = [[DDYCameraView alloc] initWithFrame:self.view.bounds];
    [_cameraView setBackBlock:^{[weakSelf handleBack];}];
    [_cameraView setToneBlock:^(BOOL isOn) {[weakSelf handleTone:isOn];}];
    [_cameraView setLightBlock:^(BOOL isRecording, BOOL isOn) {[weakSelf handleLight:isOn isRecording:isRecording];}];
    [_cameraView setToggleBlock:^{[weakSelf handleToggle];}];
    [_cameraView setTakeBlock:^{[weakSelf handleTake];}];
    [_cameraView setRecordBlock:^(BOOL isStart) {[weakSelf handleRecord:isStart];}];
    [_cameraView setFocusBlock:^(CGPoint point) {[weakSelf handleFocus:point];}];
    [self.view addSubview:_cameraView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.cameraManager ddy_StartCaptureSession];
    [self hiddenStatusBar:YES];
    [self.cameraView ddy_ResetRecordView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.cameraManager ddy_StopCaptureSession];
    [self hiddenStatusBar:NO];
}

// MARK: - UI事件响应
// MARK: 返回
- (void)handleBack {
    if (![self.navigationController popViewControllerAnimated:YES]) {
        [self dismissViewControllerAnimated:YES completion:^{ }];
    }
}

// MARK: 曝光模式
- (void)handleTone:(BOOL)isOn {
    [self.cameraManager ddy_ISO:isOn];
}

// MARK: 闪光灯模式
- (void)handleLight:(BOOL)isOn isRecording:(BOOL)isRecording {
    if (isRecording) {
         [self.cameraManager ddy_SetTorchMode:isOn ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
    } else {
         [self.cameraManager ddy_SetFlashMode:isOn ? AVCaptureFlashModeOn : AVCaptureFlashModeOff];
    }
}

// MARK: 切换摄像头
- (void)handleToggle {
    [self.cameraManager ddy_ToggleCamera];
}

// MARK: 拍照
- (void)handleTake {
    [self.cameraManager ddy_TakePhotos];
}

// MARK: 录制开始与结束
- (void)handleRecord:(BOOL)isStart {
    isStart ? [self.cameraManager ddy_StartRecorder] : [self.cameraManager ddy_StopRecorder];
}

// MARK: 点击聚焦
- (void)handleFocus:(CGPoint)point {
    [self.cameraManager ddy_FocusAtPoint:point];
}

// MARK: - cameraManger 回调
// MARK: 拍照成功
- (void)handleTakeFinish:(UIImage *)image {
    if (image && self.takePhotoBlock) {
        self.takePhotoBlock(image, self);
    }
}

// MARK: 录制成功
- (void)handleRecordFinish:(NSURL *)videoURL {
    [self.cameraManager ddy_ResetRecorder];
    if (self.recordVideoBlock) {
        self.recordVideoBlock(videoURL, self);
    }
}

// MARK: 光强检测
- (void)handleBrightness:(CGFloat)brightnessValue {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (brightnessValue > 0 && self.cameraView.isShowToneButton) {
           self.cameraView.isShowToneButton = NO;
        } else if (brightnessValue < 0 && !self.cameraView.isShowToneButton) {
            self.cameraView.isShowToneButton = YES;
        }
    });
}

// MARK: - 状态栏显隐性
- (void)hiddenStatusBar:(BOOL)sender {
    _statusBarHidden = sender;
    [self setNeedsStatusBarAppearanceUpdate];
}
// MARK: 显隐性
- (BOOL)prefersStatusBarHidden {
    return _statusBarHidden;
}

@end
