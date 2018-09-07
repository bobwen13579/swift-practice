//
//  ViewController.swift
//  MyTabletablew
//
//  Created by bobwen on 2018/9/4.
//  Copyright © 2018 bobwen. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UITabBarController{
    
    let  nextVc = NextViewController()
    let  snapkitVc = SpnakitController ()
    let  tableVc = TableViewController ()
    let  serviceVc = AppserviceVC ()
    override func viewDidLoad() {
        super.viewDidLoad()
        nextVc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        snapkitVc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        tableVc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        serviceVc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 3)
        let tabBarlist  = [nextVc,snapkitVc,tableVc,serviceVc]
        
        viewControllers = tabBarlist
        
        viewInit()
    }
    
    
func viewInit(){
    

    
}
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

