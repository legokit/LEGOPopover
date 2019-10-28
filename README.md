# LEGOPopover

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LEGOPopover is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

### podfile

To integrate LEGOPopover into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/legokit/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'LEGOPopover'
end

```
Then, run the following command:

$ pod install or $ pod update or pod update --no-repo-update

## Usage

```
UIViewController+LEGOPopover

UIViewController *vc = [[UIViewController alloc] init];

// 从中部弹出一个新的控制器
[self lg_centerPresentController:vc presentedSize:CGSizeMake(300, 200) completeHandle:^(BOOL presented) {

}];

// 从底部弹出一个新的控制器
[self lg_bottomPresentController:vc presentedHeight:220 completeHandle:^(BOOL presented) {

}];

LEGOAlertView

// 自定义设置alert样式 
LGAlertGlobalParameter *parm = [LGAlertGlobalParameter defaultConfigureMake:^(LGAlertGlobalParameter * _Nonnull configure) {
    configure.detailAttriString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    configure.title = [NSString stringWithFormat:LEGOLocalString(@"隐藏 %@", nil),filmData.film.name];
    configure.cancelString = LEGOLocalString(@"取消", nil);
    configure.completString = LEGOLocalString(@"隐藏", nil);
    configure.detailFont = [UIFont enSystemFontOfSize:15 weight:UIFontWeightRegular];
    configure.titleFont = [UIFont enSystemFontOfSize:19 weight:UIFontWeightSemibold];
    configure.cancelFont = [UIFont enSystemFontOfSize:17 weight:UIFontWeightRegular];
    configure.completFont = [UIFont enSystemFontOfSize:17 weight:UIFontWeightSemibold];
}];

[LEGOAlertView showInVc:self.currentViewController param:parm completion:^(NSInteger index) {
    if (1 == index) {
           
    }
}];

```

## Author

564008993@qq.com, 564008993@qq.com

## License

LEGOPopover is available under the MIT license. See the LICENSE file for more info.
