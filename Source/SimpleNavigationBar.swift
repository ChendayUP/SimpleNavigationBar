//
//  SimpleNavBar.swift
//  ETNavBarTransparentDemo
//
//  Created by mac on 2017/12/19.
//  Copyright © 2017年 EnderTan. All rights reserved.
//

import UIKit

// 捕获返回按钮
public protocol ShouldPopDelegate
{
    func currentViewControllerShouldPop() -> Bool
}

extension ShouldPopDelegate where Self: UIViewController {
    public func currentViewControllerShouldPop() -> Bool {
        return true
    }
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

public extension UIViewController {
    
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
    
    public func setTitleType(_ type: NavBarType?) {
        guard let type = type else { return }
        switch type {
        case .view(let view):
            self.navigationItem.titleView = view
        default:
            break
        }
    }
    
    public func setBackgroundType(_ type: NavBarBackgroundType) {
        switch type {
        case .gradual:
            self.navBarBackgroundAlpha = 1
            self.navBarTitleColor = .white
            self.navBarTintColor = .white
            self.navBarBackgroundImage = WRNavigationBar.defaultNavBarBackgroundImage
            self.navBarBackImage = WRNavigationBar.defaultNavBarWhiteBackImage
            self.statusBarStyle = .lightContent
            self.navBarShadowImageHidden = true
        case .white:
            self.navBarBackgroundAlpha = 1
            self.navBarTintColor = .black
            self.navBarTitleColor = .black
//            self.navBarBarTintColor = .white
            self.navBarBackImage = WRNavigationBar.defaultNavBarDarkBackImage
            self.navBarBackgroundImage = image(rect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 84), color: UIColor.white)
            self.statusBarStyle = .default
        case .transparent:
            self.navBarBackgroundAlpha = 0
            self.navBarTintColor = .white
            self.navBarTitleColor = .white
            self.navBarBackImage = WRNavigationBar.defaultNavBarWhiteBackImage
            self.statusBarStyle = .lightContent
            self.navBarShadowImageHidden = true
        }
    }
    
    public func setRightBarType(_ type: NavBarType?) {
        guard let type = type else { return }
        var rbutton: UIBarButtonItem?
        switch type {
        case .image(let image, let action):
            rbutton = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        case .title(let title, let action):
            rbutton = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        case .view(let view):
            rbutton = UIBarButtonItem(customView: view)
        default:
            break
        }
        self.navigationItem.rightBarButtonItem = rbutton
    }
    
    public func setLeftBarType(_ type: NavBarType?) {
        guard let type = type else { return }
        var button: UIBarButtonItem?
        switch type {
        case .image(let image, let action):
            button = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        case .title(let title, let action):
            button = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        case .view(let view):
            button = UIBarButtonItem(customView: view)
        default:
            break
        }
        self.navigationItem.leftBarButtonItem = button
    }
    
    private func image(rect: CGRect , color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        // From now on, the context gets ended if any return happens
        defer { UIGraphicsEndImageContext() }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}
