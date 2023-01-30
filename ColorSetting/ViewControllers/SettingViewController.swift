//
//  ViewController.swift
//  ColorSetting
//
//  Created by Елена Логинова on 15.12.2022.
//

import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var colorView: UIView!
    
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Private Properties
    
    var color: UIColor!
    
    //MARK: - Override Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setColorView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    // MARK: - IBActions
    
    @IBAction func pulledRedSlider() {
        setColorView()
        setValue(redSlider)
    }
    
    @IBAction func pulledGreenSlider() {
        setColorView()
        setValue(greenSlider)
    }
    
    @IBAction func pulledBlueSlider() {
        setColorView()
        setValue(blueSlider)
    }
    
    
    // MARK: - User Interface
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(_ slider: UISlider) {
        switch slider {
        case redSlider:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
        default:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTextField.text = String(format: "%.2f", blueSlider.value)
        }
    }
    
    private func setView() {
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = color
        
        redSlider.value = Float(CIColor(color: color).red)
        setValue(redSlider)
        
        greenSlider.value = Float(CIColor(color: color).green)
        setValue(greenSlider)
        
        blueSlider.value = Float(CIColor(color: color).blue)
        setValue(blueSlider)
    }
    
}

