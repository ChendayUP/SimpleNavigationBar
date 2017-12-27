//
//  QQAppController.swift
//  WRNavigationBar_swift
//
//  Created by wangrui on 2017/4/21.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar_swift

import UIKit

private let NAVBAR_COLORCHANGE_POINT:CGFloat = -80
private let IMAGE_HEIGHT:CGFloat = 260
private let SCROLL_DOWN_LIMIT:CGFloat = 100
private let LIMIT_OFFSET_Y:CGFloat = -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

class GradualViewController: UIViewController
{
    lazy var tableView:UITableView = {
        let table:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.view.bounds.height), style: .plain)
        table.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT-CGFloat(kNavBarBottom), 0, 0, 0);
        table.delegate = self
        table.dataSource = self
        return table
    }()
    lazy var imageView:UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: -IMAGE_HEIGHT, width: kScreenWidth, height: IMAGE_HEIGHT))
            imgView.contentMode = UIViewContentMode.scaleAspectFill
            imgView.clipsToBounds = true
        imgView.image = self.imageScaledToSize(image: UIImage(named: "image3")!, newSize: CGSize(width: kScreenWidth, height: IMAGE_HEIGHT+SCROLL_DOWN_LIMIT))
        return imgView
    }()
    
//    lazy var imageView2:UIImageView = {
//        let imgView = UIImageView(frame: CGRect(x: 0, y:0, width: 100, height: 100))
//        imgView.contentMode = UIViewContentMode.scaleAspectFill
//        imgView.clipsToBounds = true
//        imgView.image = self.imageScaledToSize(image: UIImage(named: "image3")!, newSize: CGSize(width: kScreenWidth, height: IMAGE_HEIGHT+SCROLL_DOWN_LIMIT))
//        return imgView
//    }()
    lazy var myView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y:0, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        tableView.addSubview(imageView)
        view.addSubview(tableView)
        
        initNavBarTitle("qq", backgroundType: .gradual)
        
//        navBarBackgroundAlpha = 0
    }
    
    deinit {
        tableView.delegate = nil
        print("FourthVC deinit")
    }
    
//    override func currentViewControllerShouldPop() -> Bool {
//        return false
//    }
//    @objc func currentViewControllerShouldPop() -> Bool {
//        return false
//    }
}

extension GradualViewController: ShouldPopDelegate {
    func currentViewControllerShouldPop() -> Bool {
        return true
    }
}

// MARK: - viewWillAppear .. ScrollViewDidScroll
extension GradualViewController
{
//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        let offsetY = scrollView.contentOffset.y
//        
//        if (offsetY > NAVBAR_COLORCHANGE_POINT) {
//            changeNavBarAnimateWithIsClear(isClear: false)
//        } else {
//            changeNavBarAnimateWithIsClear(isClear: true)
//        }
//        
//        // 限制下拉距离
//        if (offsetY < LIMIT_OFFSET_Y) {
//            scrollView.contentOffset = CGPoint.init(x: 0, y: LIMIT_OFFSET_Y)
//        }
//        
//        // 改变图片框的大小 (上滑的时候不改变)
//        // 这里不能使用offsetY，因为当（offsetY < LIMIT_OFFSET_Y）的时候，y = LIMIT_OFFSET_Y 不等于 offsetY
//        let newOffsetY = scrollView.contentOffset.y
//        if (newOffsetY < -IMAGE_HEIGHT)
//        {
//            imageView.frame = CGRect(x: 0, y: newOffsetY, width: kScreenWidth, height: -newOffsetY)
//        }
//    }
    
    // private
    private func changeNavBarAnimateWithIsClear(isClear:Bool)
    {
        UIView.animate(withDuration: 0.8, animations: { [weak self] in
            if let weakSelf = self
            {
                if (isClear == true) {
                    weakSelf.navBarBackgroundAlpha = 0
                }
                else {
                    weakSelf.navBarBackgroundAlpha = 1.0
                }
            }
        })
    }
    
    // private
    fileprivate func imageScaledToSize(image:UIImage, newSize:CGSize) -> UIImage
    {
        UIGraphicsBeginImageContext(CGSize(width: newSize.width * 2.0, height: newSize.height * 2.0))
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width * 2.0, height: newSize.height * 2.0))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
        UIGraphicsEndImageContext()
        return newImage
    }
}


extension GradualViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let str = String(format: "WRNavigationBar %zd", indexPath.row)
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:UIViewController = UIViewController()
        vc.view.backgroundColor = UIColor.white
        let str = String(format: "WRNavigationBar %zd", indexPath.row)
        vc.title = str
        navigationController?.pushViewController(vc, animated: true)
    }
}
