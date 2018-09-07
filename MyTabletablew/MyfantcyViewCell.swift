//
//  MyfantcyViewCell.swift
//  MyTabletablew
//
//  Created by bobwen on 2018/9/6.
//  Copyright © 2018 bobwen. All rights reserved.
//

import UIKit
import RAMPaperSwitch

class MyfantcyViewCell: UITableViewCell {
    
    let oneView = UIView()
    let twoView = UIView()
    let swtich = UISwitch()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.backgroundColor = UIColor.blue
        viewinit()
    }
    
    func viewinit(){
        
        let myswtich = RAMPaperSwitch(view: swtich,color: UIColor.red)
        
        oneView.backgroundColor = UIColor.darkGray
        twoView.backgroundColor = UIColor.brown
        
        self.addSubview(oneView)
        oneView.snp.makeConstraints{(make) in
            make.height.equalTo(75)
            make.top.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        self.addSubview(twoView)
        twoView.snp.makeConstraints{(make) in
            make.height.equalTo(100)
            make.left.equalTo(8)
            //make.right.equalTo(-8)
            make.bottom.right.equalToSuperview().offset(-58)
        }
        
        self.addSubview(myswtich)
        myswtich.snp.makeConstraints{(make) in
            make.height.equalTo(50)
            make.left.equalTo(8)
            make.bottom.right.equalToSuperview().offset(-8)
        }
        
        myswtich.animationDidStartClosure = {(onAnimation: Bool) in
            UIView.transition(with: self, duration: myswtich.duration, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.backgroundColor = onAnimation ? UIColor.darkGray : UIColor.blue
            }, completion:nil)
        }
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    /*
    //animation
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }*/
    
}
