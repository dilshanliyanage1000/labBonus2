//  MultiComponentPickerViewController.swift
//  labBonus2
//
//  Created by Dilshan Nayanamadhu on 2022-10-23.

import UIKit

class MultiComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var MultiPickerControl: UIPickerView!
    
    let Red = ColourChannel.Red
    let Blue = ColourChannel.Blue
    let Green = ColourChannel.Green
    
    var ValueArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildValueArray()
        
        MultiPickerControl.selectRow(255, inComponent: Red.rawValue, animated: true)
        MultiPickerControl.selectRow(255, inComponent: Green.rawValue, animated: true)
        MultiPickerControl.selectRow(255, inComponent: Blue.rawValue, animated: true)
        
    }
    
    func buildValueArray() {
        
        // Building array in reverse
        for index in stride(from: 255, through: 0, by: -1)
        {
            ValueArray.append(String(index))
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // Number of wheels
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Number of rows
        return 256
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ValueArray[row]
    }
    
    @IBAction func SelectOptionButton_Pressed(_ sender: UIButton) {
        
        let RedChannelIndex = MultiPickerControl.selectedRow(inComponent: Red.rawValue)
        let BlueChannelIndex = MultiPickerControl.selectedRow(inComponent: Blue.rawValue)
        let GreenChannelIndex = MultiPickerControl.selectedRow(inComponent: Green.rawValue)
        
        let RedChannel = CGFloat((ValueArray[RedChannelIndex] as NSString).floatValue)/255.0
        let BlueChannel = CGFloat((ValueArray[BlueChannelIndex] as NSString).floatValue)/255.0
        let GreenChannel = CGFloat((ValueArray[GreenChannelIndex] as NSString).floatValue)/255.0
        
        print("Red : \(RedChannel) Green : \(GreenChannel) Blue : \(BlueChannel)")
        
        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(red: RedChannel, green: GreenChannel, blue: BlueChannel, alpha: 1.0)
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
}
