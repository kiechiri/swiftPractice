//
//  ProfileViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/24.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "プロフィール設定"
        
        //statusBarの高さを取得する
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        //画面サイズを取得
        let width: CGFloat! = self.view.bounds.width
        let height: CGFloat! = self.view.bounds.height
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
