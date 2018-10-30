Pod::Spec.new do |ddyspec|
    ddyspec.name         = 'DDYCamera'
    ddyspec.version      = '1.0.0'
    ddyspec.summary      = '相机的封装，能够拍摄图片和录制视频，可以利用现成的控制器，也可以用DDYCameraManager加自定义UI'
    ddyspec.homepage     = 'https://github.com/RainOpen/DDYCamera'
    ddyspec.license      = 'MIT'
    ddyspec.authors      = {'Rain' => '634778311@qq.com'}
    ddyspec.platform     = :ios, '8.0'
    ddyspec.source       = {:git => 'https://github.com/RainOpen/DDYCamera.git', :tag => ddyspec.version}
    ddyspec.source_files = 'DDYCamera/DDYCamera/*.{h,m}'
    ddyspec.resource     = 'DDYCamera/DDYCamera/DDYCamera.bundle'
    ddyspec.requires_arc = false
end