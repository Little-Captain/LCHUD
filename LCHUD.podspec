#
# Be sure to run `pod lib lint LCHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCHUD'
  s.version          = '1.0.0'
  s.summary          = 'LCHUD是一个基于MBProgressHUD的扩展框架'
  s.description      = <<-DESC
LCHUD是一个基于MBProgressHUD的扩展框架, 内部用到了运行时技术.
                       DESC
  s.homepage         = 'https://github.com/Little-Captain/LCHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Little-Captain' => 'littlecaptain@foxmail.com' }
  s.source           = { :git => 'https://github.com/Little-Captain/LCHUD.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LCHUD/Classes/**/*'
  s.dependency 'MBProgressHUD'
end
