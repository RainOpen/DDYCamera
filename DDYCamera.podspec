Pod::Spec.new do |ddyspec|
    ddyspec.name         = 'DDYCamera'
    ddyspec.version      = '1.0.0'
    ddyspec.summary      = '多语言国际化工具(应用内国际化/跟随系统)'
    ddyspec.homepage     = 'https://github.com/RainOpen/DDYCamera'
    ddyspec.license      = 'MIT'
    ddyspec.authors      = {'Rain' => '634778311@qq.com'}
    ddyspec.platform     = :ios, '8.0'
    ddyspec.source       = {:git => 'https://github.com/RainOpen/DDYCamera.git', :tag => ddyspec.version}
    ddyspec.source_files = 'DDYCamera/DDYCamera/*.{h,m}'
    ddyspec.resource     = 'DDYCamera/DDYCamera/DDYCamera.bundle'
    ddyspec.requires_arc = false
end