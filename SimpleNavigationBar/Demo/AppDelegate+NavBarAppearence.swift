//
//  AppDelegate+NavBarAppearence.swift
//  SimpleNavigationBar
//
//  Created by mac on 2017/12/27.
//  Copyright © 2017年 iOSCode. All rights reserved.
//

import UIKit

extension AppDelegate {

    func setNavBarAppearence()
    {
        // 设置深色返回按钮图片
        WRNavigationBar.defaultNavBarDarkBackImage = #imageLiteral(resourceName: "后退-黑色")
        // 设置浅色返回按钮图片
        WRNavigationBar.defaultNavBarWhiteBackImage = #imageLiteral(resourceName: "后退-白")
        // 背景图片 这里是渐变图片
        var size = CGSize(width: UIScreen.main.bounds.size.width, height: 64+20)
        WRNavigationBar.defaultNavBarBackgroundImage = UIImage.gradient(size: size, colors:[UIColor(hex: 0x72D989), UIColor(hex: 0x47D3C9)])
        // 设置导航栏分割线颜色
        size = CGSize(width: UIScreen.main.bounds.size.width, height: 1)
        WRNavigationBar.defaultNavBarShadowImage = UIImage.image(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: size), color: UIColor(hex: 0xf2f2f2))
    }
}

extension UIImage {
    static func gradient(size : CGSize, colors : [UIColor]) -> UIImage? {
        // Turn the colors into CGColors
        let cgcolors = colors.map { $0.cgColor }
        
        // Begin the graphics context
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        
        // If no context was retrieved, then it failed
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // From now on, the context gets ended if any return happens
        defer { UIGraphicsEndImageContext() }
        
        // Create the Coregraphics gradient
        var locations : [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }
        
        // Draw the gradient
        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])
        
        // Generate the image (the defer takes care of closing the context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    static func image(rect: CGRect , color: UIColor) -> UIImage? {
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

public extension UIColor {
    
    /**
     eg. UIColor.hexColor(0x000000)
     
     */
    
    public convenience init(hex hexValue: Int, alpha: CGFloat = 1) {
        let redValue   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let greenValue = CGFloat((hexValue & 0xFF00) >> 8) / 255.0
        let blueValue  = CGFloat(hexValue & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
    
    public convenience init(hexString: String, alpha: CGFloat = 1) {
        var result: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&result)
        self.init(hex: Int(result))
    }
}
