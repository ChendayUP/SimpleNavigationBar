//
//  NormalListController.swift
//  WRNavigationBar_swift
//
//  Created by wangrui on 2017/4/19.
//  Copyright © 2017年 wangrui. All rights reserved.
//
//  Github地址：https://github.com/wangrui460/WRNavigationBar_swift

import UIKit

let kNavBarBottom = WRNavigationBar.navBarBottom()

class NormalListController: UIViewController
{
    lazy var tableView:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: self.view.bounds.height), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        initNavBarTitle("首页", backgroundType: .gradual)
        // 改变标题文字大小
        // navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 22)]
    }
}



// MARK: - tableView delegate / dataSource
extension NormalListController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        var str:String? = nil
        switch indexPath.row {
        case 0:
            str = "透明背景"
        case 1:
            str = "渐变背景"
        case 2:
            str = "自定义titleView"
        case 3:
            str = "白色背景+右按钮"
        default:
            str = ""
        }
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(TransparentController(), animated: true)
        case 1:
            navigationController?.pushViewController(GradualViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(WhiteViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(NewViewController(), animated: true)
        default:
           break
        }
    }
}




