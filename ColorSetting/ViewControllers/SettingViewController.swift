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
    var delegate: SettingViewControllerDelegate!
    
    //MARK: - Override Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
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
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - User Interface
    
    private func setView() {
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = color
        
        redSlider.value = Float(CIColor(color: color).red)
        setValue(redSlider)
        
        greenSlider.value = Float(CIColor(color: color).green)
        setValue(greenSlider)
        
        blueSlider.value = Float(CIColor(color: color).blue)
        setValue(blueSlider)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
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
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

//MARK: - UITextFieldDelegate

extension SettingViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        
        if let numberValue = Float(newValue) {
            switch textField {
            case redTextField:
                redSlider.value = numberValue
                redLabel.text = numberValue.formatted()
            case greenTextField:
                greenSlider.value = numberValue
                greenLabel.text = numberValue.formatted()
            default:
                blueSlider.value = numberValue
                blueLabel.text = numberValue.formatted()
            }
            setColorView()
        } else {
            showAlert(title: "Incorrect value", message: "Please enter a value fron 0 to 1")
        }
    }
    
}

