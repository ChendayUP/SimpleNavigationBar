//
//  NavigationBackgroundView.swift
//  WRNavigationBar_swift
//
//  Created by mac on 2017/12/26.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit

class NavigationBackgroundView: UIView {
    
    var currentImageView: UIImageView?
    var nextImageView: UIImageView?
    
    func change(to: UIImage, progress: CGFloat) {

        if nextImageView == nil {
            nextImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
            nextImageView?.contentMode = UIViewContentMode.scaleAspectFill
            nextImageView?.clipsToBounds = true
            nextImageView?.image = to
            insertSubview(nextImageView!, belowSubview: currentImageView!)
        }
        currentImageView?.alpha = 1 - progress
        
    }
    
    func updateImageView(_ image: UIImage) {
        if currentImageView == nil {
            currentImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
            currentImageView?.contentMode = UIViewContentMode.scaleAspectFill
            currentImageView?.clipsToBounds = true
            addSubview(currentImageView!)
        }
        currentImageView?.image = image
        currentImageView?.alpha = 1
        nextImageView?.removeFromSuperview()
        nextImageView = nil
    }
  
}
