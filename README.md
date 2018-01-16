# SimpleNavigationBar
Change NavigationBar's transparency at pop gestrue and other situation


## Installation
Add the following line to your Podfile:
```ruby
pod 'SimpleNavigationBar'
```

Then, run the following command:
```bash
$ pod install
```

Or, simply drag Source folder to your project.

## Usage

set navigationBar type one line:

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        initNavBarTitle("微博1",backgroundType: .transparent, rightButton: .title("主页", nil)) 
}
```

source code

```swift
public func initNavBarTitle(_ title: String? = nil,
                                backgroundType type1: NavBarBackgroundType = .white,
                                leftButton type3: NavBarType? = nil,
                                rightButton type2: NavBarType? = nil,
                                titleView type4: NavBarType? = nil) {
        self.title = title
        setBackgroundType(type1)
        setRightBarType(type2)
        setLeftBarType(type3)
        setTitleType(type4)
}

public enum NavBarType {
    case none
    case back
    case image(UIImage,Selector?)
    case title(String,Selector?)
    case view(UIView)
}

public enum NavBarBackgroundType {
    case white // 白色
    case transparent //透明
    case gradual // 渐变
}
```

set navigationBar Appearence in AppDelegate

```swift 
func setNavBarAppearence() {
    // 设置深色返回按钮图片
    WRNavigationBar.defaultNavBarDarkBackImage = UIImage(named: "后退-黑色")
    // 设置浅色返回按钮图片
    WRNavigationBar.defaultNavBarWhiteBackImage = UIImage(named: "后退-白")
    // 背景图片 这里是渐变图片
    var size = CGSize(width: UIScreen.main.bounds.size.width, height: 64+20)
    WRNavigationBar.defaultNavBarBackgroundImage = UIImage.gradient(size: size, colors:[UIColor(hex: 0x72D989), UIColor(hex: 0x47D3C9)])
    // 设置导航栏分割线颜色
    size = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
    WRNavigationBar.defaultNavBarShadowImage = UIImage.image(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: size), color: UIColor(hex: 0xf2f2f2))
}
```

## Related
Based on the [WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift)

## License
MIT license. See LICENSE for details.

## Contact

