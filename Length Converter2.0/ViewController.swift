//
//  ViewController.swift
//  Length Converter2.0
//
//  Created by Ernesto Rodrigues on 1/3/19.
//  Copyright © 2019 Ernesto Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var kmButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    
    //@IBOutlet weak var textFieldOne: UITextField!
    
    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        labelTwo.layer.borderWidth = 1;
        
    }
    
    @IBAction func textFieldOne(_ sender: UITextField) {
        sender.resignFirstResponder()
        
    }
    
        //var result: Double = miles * 3.0
    
    @IBAction func kmButtonPressed(_ sender: Any) {
        /*
        let miles: String = textField1.text!
        let reuslt: Double = Double(miles)! * 1.609344
        print(reuslt)
        //labelTwo.resignFirstResponder()
        labelTwo.text = String(reuslt)
         */ //Convert miles to kilometers.
        
        let miles: Double = Double(textField1.text!)!;
        textField1.resignFirstResponder();
        var measurement: Measurement = Measurement(value: miles, unit: UnitLength.miles);
        measurement.convert(to: .kilometers);
        labelTwo.text = String(measurement.value);
      
        
    }
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        
        sender.text = "0";
    }
    
    @IBAction func mButtonPressed(_ sender: UIButton) {
        let miles = textField1.text!
        let reuslt: Double = Double(miles)! * 1609.344
        print(reuslt)
        //labelTwo.resignFirstResponder()
        textField1.resignFirstResponder();
        labelTwo.text = String(reuslt)
    }
    

    @IBAction func editingChanged(_ sender: UITextField) {
        print("editingChanged \(sender.text!)");
        if sender.text!.count >= 1 {
            mButton.isEnabled = true;
            kmButton.isEnabled = true;
        } else {
            mButton.isEnabled = false;
            kmButton.isEnabled = false;
        }
        
        //Chop off leading 0 if there are 2 or more characters.
        
        if sender.text!.count >= 2 && sender.text!.hasPrefix("0") {
            sender.text = String(sender.text!.dropFirst());
        }
    }
}

