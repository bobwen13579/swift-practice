//
//  AppserviceVC.swift
//  MyTabletablew
//
//  Created by bobwen on 2018/9/6.
//  Copyright © 2018 bobwen. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation
class AppserviceVC: UIViewController,CLLocationManagerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
  
    

    let xLabel = UILabel()
    let yLabel = UILabel()
    let timeLabel = UILabel()
    let countLabel = UILabel()
    let averageLabel = UILabel()
    let maxtimelabel = UILabel()
    let mintimelabel = UILabel()
    
    let textField = UITextField()
    
    let startButton = UIButton()
    let picker = UIPickerView()
    
    var leftString :String = ""
    var rightString :String = ""
    
    var chooseRow:Int = 0
    let manager = CLLocationManager()
    
    var countTimes :Int = 0
    var lastTime : Date = Date()
    var maxTime : Double = 0.0
    var minTime : Double = 0.0
    
    var  average : Double = 0.0
    var  Accuracy : Int = 0;
    let  pickerAccuracy = [kCLLocationAccuracyBestForNavigation,
        kCLLocationAccuracyBest,
        kCLLocationAccuracyNearestTenMeters,
        kCLLocationAccuracyHundredMeters,
        kCLLocationAccuracyKilometer,
        kCLLocationAccuracyThreeKilometers]
    
    var pickerData = [["BestForNavigation",
                        "Best",
                        "NearestTenMeters",
                        "HundredMeters",
                        "Kilometer",
                        "ThreeKilometers"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array()
        pickerInit()
        locationInit()
        viewInit()
    }
    
    func pickerInit(){
        picker.delegate = self
        picker.dataSource = self
    }
    
    func array(){
        var num :Int = 0
        var array :[String] = []
        while num < 100 {
            num += 1
            array.append(String(num))
        }
        pickerData.append(array)
        //return pickerData
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print("row\(row) component \(component)")
        if(component == 0){
            Accuracy = row
            leftString = pickerData[component][row]
        }
        if(component == 1){
            chooseRow = row
            rightString = pickerData[component][row]
        }
        textField.text = "定位精度：" + leftString + "定位距离：" + rightString
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        picker.isHidden = true
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func locationInit(){
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }
    
    func viewInit(){
        self.view.addSubview(xLabel)
        self.view.addSubview(yLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(countLabel)
        self.view.addSubview(averageLabel)
        self.view.addSubview(startButton)
        self.view.addSubview(mintimelabel)
        self.view.addSubview(maxtimelabel)
        self.view.addSubview(textField)
        
        
        xLabel.text = "1"
        yLabel.text = "2"
        timeLabel.text = "3"
        countLabel.text = "4"
        averageLabel.text = "5"
        
    xLabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalToSuperview().offset(50);
    }
        
    yLabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(xLabel).offset(50)
    }
        
    timeLabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(yLabel).offset(50)
    }
    
    countLabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(timeLabel).offset(50)
    }
     
        
    maxtimelabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(countLabel).offset(50)
    }
        
    mintimelabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(maxtimelabel).offset(50)
    }
        
    averageLabel.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(mintimelabel).offset(50)
    }
    
        textField.delegate = self
        textField.layer.borderWidth = 1.0
        textField.text = "点击设置定位精度"
        //textField.borderStyle = UITextBorderStyleRoundedRect
        textField.snp.makeConstraints{make in
            make.height.equalTo(30)
            make.top.equalTo(averageLabel).offset(50)
        }
        
        startButton.setTitle("start", for: .normal)
        startButton.setTitleColor(UIColor.blue, for: .normal) //= UIColor.blue
        
        startButton.addTarget(self, action: #selector(startLocaton), for: .touchUpInside)
        
    startButton.snp.makeConstraints{make in
        make.height.left.equalTo(50)
        make.top.equalTo(textField).offset(50)
    }
        picker.isHidden = true
        self.view.addSubview(picker)
        picker.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(-10)
        }
}
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        picker.isHidden = false
        return false
    }
    
    @objc func startLocaton(){
        manager.stopUpdatingLocation()
        countTimes = 0
        average = 0
        maxTime = 0
        minTime = 0
        lastTime = NSDate() as Date
        xLabel.text = "0"
        yLabel.text = "0"
        timeLabel.text = "0"
        countLabel.text = "0"
        maxtimelabel.text = "0"
        mintimelabel.text = "0"
        averageLabel.text = "0"
        manager.distanceFilter = CLLocationDistance(chooseRow)
        manager.desiredAccuracy = pickerAccuracy[Accuracy]
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let doubletimes :Double = Double(countTimes)
        var tempNumber  = 0.0
        xLabel.text = "\(String(describing: locations.last!.coordinate.latitude))"
        yLabel.text = "\(String(describing: locations.last!.coordinate.longitude))"
        if(countTimes != 0){
            tempNumber  = locations.last!.timestamp.timeIntervalSince(lastTime)
            timeLabel.text = "时间差：\(tempNumber) 秒"
            average = average*(doubletimes - 1)/(doubletimes) + tempNumber/(doubletimes)
        }
        if(countTimes == 1){
            minTime = tempNumber
            maxTime = tempNumber
        }
        else if(countTimes > 1){
            minTime = min(minTime, tempNumber)
            maxTime = max(maxTime,tempNumber)
        }
        
        maxtimelabel.text = "最大时间间隔\(maxTime)"
        mintimelabel.text = "最小时间间隔\(minTime)"
        
        countTimes += 1
        lastTime = locations.last!.timestamp
        countLabel.text = "第\(countTimes)次更新位置"
        averageLabel.text = "平均时间\(average)"
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
