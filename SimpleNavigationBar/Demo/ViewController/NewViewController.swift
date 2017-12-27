//
//  NewViewController.swift
//  WRNavigationBar_swift
//
//  Created by mac on 2017/12/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "new"
        initNavBarTitle("new",backgroundType: .white, rightButton: .title("删除", #selector(deleteAction)))
        // Do any additional setup after loading the view.
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width , height: 300))
        imageview.image = #imageLiteral(resourceName: "mysl")
        view.addSubview(imageview)
    }
    
    @objc func deleteAction() {
        
    }


}
