//
//  ViewController.swift
//  Counter
//
//  Created by Daniel Suskevic on 11/11/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var hourPicker: UIPickerView!
    @IBOutlet weak var minutePicker: UIPickerView!
    @IBOutlet weak var secondPicker: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    
    let hours = Array(0...24)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    var timer : Timer?
    var state : Bool = false
    var isValid : Bool? = nil
    
    var hValue : Int = 0
    var mValue : Int = 0
    var sValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //startTimers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimers() {
        if state == false {
            pause()
        } else if state == true {
            start()
        }
            //timerHours()
            //timerMinutes()
            timerSeconds()
    }
    
    func start() {
            timer?.invalidate()
    }
    
    func pause() {
        timer?.invalidate()
    }
    /*
     func timerHours() {
     Timer.scheduledTimer(timeInterval: 3600.0, target: self, selector: #selector(updateTimerHours), userInfo: nil, repeats: true)
     }
     
     func timerMinutes() {
     Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateTimerMinutes), userInfo: nil, repeats: true)
     }
     */
    func timerSeconds() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimerSeconds), userInfo: nil, repeats: true)

    }
    /*
     @objc func updateTimerHours() {
     hValue -= 1
     label.text = String(describing: (hValue,mValue,sValue))
     }
     @objc func updateTimerMinutes() {
     mValue -= 1
     label.text = String(describing: (hValue,mValue,sValue))
     }
     */
    @objc func updateTimerSeconds() {
        
        sValue -= 1
        if sValue < 0 {
            sValue = 59
            mValue -= 1
        }
        if mValue < 0 {
            mValue = 59
            hValue -= 1
        }
        
        label.text = "h: \(hValue), m: \(mValue), s: \(sValue)"
    }
    
    @IBAction func tapped(_ sender: Any) {
        if state == false {
            state = true
            startTimers()
            
        } else {
            state = false
            timer?.invalidate() // does not stop
        }
        
    }
    
    
    // MARK: Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows : Int = 0
        
        if pickerView == hourPicker {
            countRows = self.hours.count
        } else if pickerView == minutePicker {
            countRows = self.minutes.count
        } else if pickerView == secondPicker {
            countRows = self.seconds.count
        }
        
        return countRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == hourPicker {
            let titleRow = String(hours[row])
            return titleRow
        } else if pickerView == minutePicker {
            let titleRow = String(minutes[row])
            return titleRow
        } else if pickerView == secondPicker {
            let titleRow = String(seconds[row])
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == hourPicker {
            //label.text = String(hours[row])
            hValue = hours[row]
        } else if pickerView == minutePicker {
            //label.text = String(minutes[row])
            mValue = minutes[row]
        } else if pickerView == secondPicker {
            //label.text = String(seconds[row])
            sValue = seconds[row]
        }
    }
    
}

