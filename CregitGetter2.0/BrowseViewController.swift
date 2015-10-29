//
//  BrowseViewController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/23.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    var selectedNumber:Int?
    var courceNumber:Int?
    var seletedClassName:String?
    
    //投稿ボタン
    var post_button: UIBarButtonItem!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "詳細選択"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 178/255, green: 7/255, blue: 13/255, alpha: 1.0)
        
        post_button = UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "onClick")
        self.navigationItem.rightBarButtonItem = post_button

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onClick(){
        let VC = PostViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }

    

}
