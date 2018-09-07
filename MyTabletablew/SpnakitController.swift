//
//  SpnakitController.swift
//  MyTabletablew
//
//  Created by bobwen on 2018/9/6.
//  Copyright © 2018 bobwen. All rights reserved.
//

import UIKit
import SnapKit

class SpnakitController: UIViewController {


    let mainview = UIView()
    
    var updownConstraint: Constraint?
    var rightleftConstraint: Constraint?
    
    var updownnum = 0
    var leftrightnum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigateInit()
        viewinit()
    }
    
    func viewinit(){
        
        
        mainview.backgroundColor = UIColor.blue
        self.view.addSubview(mainview)
        mainview.snp.makeConstraints{(make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
        let oneview = UIView()
        oneview.backgroundColor = UIColor.red
        mainview.addSubview(oneview)
        oneview.snp.makeConstraints{(make)in
            make.width.height.equalTo(80)
            make.center.equalToSuperview()
        }
        
        let sideview = UIView()
        sideview.backgroundColor = UIColor.orange
        mainview.addSubview(sideview)
        sideview.snp.makeConstraints{(make) in
            //距离父视图 10
            //make.top.equalTo(mainview.snp.bottom).offset(10)
            self.updownConstraint = make.top.equalTo(10).constraint
            self.rightleftConstraint = make.left.equalTo(10).constraint
            make.width.height.equalToSuperview()
            make.centerX.greaterThanOrEqualTo(mainview)
        }
        
        let up = UIButton()
        up.backgroundColor = UIColor.darkGray
        up.setTitle("up", for: .normal)
        up.addTarget(self, action: #selector(downConstraintMethod), for: .touchUpInside)
        self.view.addSubview(up)
        up.snp.makeConstraints{(make) in
            //距离父视图 10
            make.top.equalToSuperview().offset(100)
            make.height.width.equalTo(50)
            make.centerX.greaterThanOrEqualTo(self.view)
        }
        
        let down = UIButton()
        down.backgroundColor = UIColor.darkGray
        down.setTitle("down", for: .normal)
        down.addTarget(self, action: #selector(upConstraintMethod), for: .touchUpInside)
        self.view.addSubview(down)
        down.snp.makeConstraints{(make) in
            make.top.equalTo(up).offset(100)
            make.height.width.equalTo(50)
            make.centerX.greaterThanOrEqualTo(self.view)
        }
        
        let left = UIButton()
        left.backgroundColor = UIColor.darkGray
        left.setTitle("left", for: .normal)
        left.addTarget(self, action: #selector(leftConstraintMethod), for: .touchUpInside)
        self.view.addSubview(left)
        left.snp.makeConstraints{(make) in
            //距离父视图 10
            make.top.equalToSuperview().offset(150)
            make.height.width.equalTo(50)
            make.left.greaterThanOrEqualTo(self.view).offset(20)
        }
        
        let right = UIButton()
        right.backgroundColor = UIColor.darkGray
        right.setTitle("right", for: .normal)
        right.addTarget(self, action: #selector(rightConstraintMethod), for: .touchUpInside)
        self.view.addSubview(right)
        right.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(150)
            make.height.width.equalTo(50)
            make.right.greaterThanOrEqualTo(self.view).offset(-20)
        }
    }
    
    @objc func downConstraintMethod(){
        updownnum -= 20
        self.updownConstraint?.update(offset: updownnum)
    }
    @objc func upConstraintMethod(){
        updownnum += 20
        self.updownConstraint?.update(offset: updownnum)
    }
    @objc func leftConstraintMethod(){
        leftrightnum -= 20
        self.rightleftConstraint?.update(offset: leftrightnum)
    }
    @objc func rightConstraintMethod(){
        leftrightnum += 20
        self.rightleftConstraint?.update(offset: leftrightnum)
    }
    
    
    //
    func navigateInit(){
        let rightIteam:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "duty_choicemore"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(Tapdown(_:)))
        self.navigationItem.rightBarButtonItem = rightIteam
    }
    
    @objc   func Tapdown(_ button:UIButton){
        print("touch")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
