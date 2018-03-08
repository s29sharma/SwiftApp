//
//  ViewController.swift
//  EggCalculator
//
//  Created by sachin sharma on 3/7/18.
//  Copyright © 2018 sachin sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var Timer: UILabel!
    @IBAction func startButton(_ sender: Any) {
        
        Button.setTitle("stop", for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    let conditions = ["soft","medium","hard"]
    let temps = ["200","225","250","275","300","325","350","375","400","1000"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0:
            return conditions.count
        case 1:
            return temps.count
        default:
            return 4
        }
    }
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            return conditions[row]
        case 1:
            return temps[row]
        default:
            return ""
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let condition =  conditions[pickerView.selectedRow(inComponent: 0)]
        let temp =  Int(temps[pickerView.selectedRow(inComponent: 1)])
        
        let heat: Int
        let minutes: Int
        let seconds:Int
        let time: Double
        
        if(condition == "soft"){
            heat = 10000;
        }
        else if(condition == "medium"){
            heat = 20000;
        }
        else if(condition == "hard"){
            heat = 30000;
        }
        else{
            heat = 10;
        }
        
        time = Double(heat/temp!);
        let stringseconds : String
        let stringminutes : String
        minutes = Int((time.truncatingRemainder(dividingBy: 3600)) / 60)
        seconds = Int(time.truncatingRemainder(dividingBy: 60))
       
        if(minutes<10){
            stringminutes = String("0"+String(minutes))
        }
        else{
            stringminutes = String(minutes)
        }
        
        if(seconds<10){
            stringseconds = String("0"+String(seconds))
        }
        else{
            stringseconds = String(seconds)
        }
        let finaltime = stringminutes + " : " + stringseconds;
        
        Timer.text = finaltime
    }
}

