/// MARK: - DDYAuthManager 2018/10/30
/// !!!: Author: 豆电雨
/// !!!: QQ/WX:  634778311
/// !!!: Github: https://github.com/RainOpen/
/// !!!: Blog:   https://juejin.im/user/57dddcd8128fe10064cadee9
/// MARK: - 相机管理器

#import <UIKit/UIKit.h>

@interface DDYCameraView : UIView

/// 点击返回回调
@property (nonatomic, copy) void (^backBlock)(void);
/// 曝光模式点击回调
@property (nonatomic, copy) void (^toneBlock)(BOOL isOn);
/// 闪光灯模式点击回调
@property (nonatomic, copy) void (^lightBlock)(BOOL isRecording, BOOL isOn);
/// 切换摄像头点击回调
@property (nonatomic, copy) void (^toggleBlock)(void);
/// 点击拍照回调
@property (nonatomic, copy) void (^takeBlock)(void);
/// 录制事件回调
@property (nonatomic, copy) void (^recordBlock)(BOOL isStart);
/// 点击聚焦回调
@property (nonatomic, copy) void (^focusBlock)(CGPoint point);

/// 曝光明暗度按钮显隐
@property (nonatomic, assign) BOOL isShowToneButton;

/// 重置view
- (void)ddy_ResetRecordView;

@end
