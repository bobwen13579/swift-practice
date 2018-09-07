//
//  NextViewController.swift
//  MyTabletablew
//
//  Created by bobwen on 2018/9/5.
//  Copyright © 2018 bobwen. All rights reserved.
//

import UIKit
import RAMPaperSwitch


class NextViewController: UIViewController {
    
    let vctable = TableViewController()
    //let paperSwitch1: RAMPaperSwitch!
    //let paperSwitch2: RAMPaperSwitch!
    //let paperSwitch = RAMPaperSwitch
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setupPaperSwitch()
        //self.view.backgroundColor = UIColor.orange
        //self.setupPaperSwitch()
        viewinit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func viewinit(){
        self.title = "second view"
        let button = UIButton(frame: CGRect(x:100,y:20, width: 100, height: 50))
        button.setTitle("下一页", for:.normal)
        button.backgroundColor =  UIColor.orange
        button.center = CGPoint(x:100,y:200)
        button.addTarget(self, action:#selector(Tapdown(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 4
        self.view.addSubview(button)
        
        let label  = UILabel(frame: CGRect(x: 70, y: 20, width: 100, height: 50))
        label.center = CGPoint(x:200,y:200)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "hello"
        self.view.addSubview(label)
        
        
        let swtchorange = UISwitch();
        let swtich = RAMPaperSwitch(view: swtchorange, color: UIColor.black)
        self.view.addSubview(swtich)
        swtich.snp.makeConstraints{(make) in
            make.width.height.equalTo(50)
            make.top.equalTo(button).offset(50)
        }
        
        swtich.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: button, duration: swtich.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                button.backgroundColor = onAnimation ? UIColor.darkGray : UIColor.blue
            }, completion:nil)
        }
    }
    /*
    fileprivate func setupPaperSwitch() {
        
        self.paperSwitch1.animationDidStartClosure = {(onAnimation: Bool) in
            
            self.animateLabel(self.connectContactsLabel, onAnimation: onAnimation, duration: self.paperSwitch1.duration)
            self.animateImageView(self.phone1ImageView, onAnimation: onAnimation, duration: self.paperSwitch1.duration)
        }
        
        
        self.paperSwitch2.animationDidStartClosure = {(onAnimation: Bool) in
            
            self.animateLabel(self.self.allowDiscoveryLabel, onAnimation: onAnimation, duration: self.paperSwitch2.duration)
            self.animateImageView(self.phone2ImageView, onAnimation: onAnimation, duration: self.paperSwitch2.duration)
        }
    }
    
    fileprivate func animateLabel(_ label: UILabel, onAnimation: Bool, duration: TimeInterval) {
        UIView.transition(with: label, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            label.textColor = onAnimation ? UIColor.white : UIColor(red: 31/255.0, green: 183/255.0, blue: 252/255.0, alpha: 1)
        }, completion:nil)
    }
    
    fileprivate func animateImageView(_ imageView: UIImageView, onAnimation: Bool, duration: TimeInterval) {
        UIView.transition(with: imageView, duration: duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            imageView.image = UIImage(named: onAnimation ? "img_phone_on" : "img_phone_off")
        }, completion:nil)
    }
    */
    @objc   func Tapdown(_ button:UIButton){
        self.navigationController?.pushViewController(vctable, animated: true)
        print("touch")
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
