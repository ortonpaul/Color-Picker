//
//  ColorPickerViewController.swift
//  Color Picker
//
//  Created by Paul Orton on 3/21/19.
//  Copyright © 2019 Paul Orton. All rights reserved.
//

import UIKit

struct Color {
    var name: String
    var color: UIColor
}

let initial = Int.random(in: 0...colors.count)

var colors = [ Color(name: "Red", color: UIColor.red),
               Color(name: "Orange", color: UIColor.orange),
               Color(name: "Yellow", color: UIColor.yellow),
               Color(name: "Green", color: UIColor.green),
               Color(name: "Blue", color: UIColor.blue),
               Color(name: "Purple", color: UIColor.purple) ]

class ColorPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var colorPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        view.backgroundColor = colors[initial].color
        textLabel.text = colors[initial].name
        colorPicker.selectRow(initial, inComponent: 0, animated: true)
    }
    

   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.backgroundColor = colors[row].color
        textLabel.text = colors[row].name
    }
}
