//
//  NavigationController.swift
//  CregitGetter2.0
//
//  Created by 綿岡晃輝 on 2015/10/22.
//  Copyright © 2015年 綿岡晃輝. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*NavigationBar上の戻るボタンで戻るときに通る*/
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromLeft
        
        self.view.layer.addAnimation(transition, forKey: kCATransition)
        
        
        return super.popViewControllerAnimated(false)!
    }
}
