//
//  ViewController.swift
//  ColorSetting
//
//  Created by Елена Логинова on 15.12.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var colorView: UIView!
    
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Private Properties
    
    
    
    //MARK: - Override Func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 10
        setColorView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    

    // MARK: - IBActions
    
    @IBAction func pulledRedSlider() {
        setColorView()
        redLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func pulledGreenSlider() {
        setColorView()
        greenLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func pulledBlueSlider() {
        setColorView()
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    
    // MARK: - User Interface
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
}

