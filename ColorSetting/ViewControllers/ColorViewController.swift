//
//  ColorViewController.swift
//  ColorSetting
//
//  Created by Елена Логинова on 30.01.2023.
//

import UIKit

final class ColorViewController: UIViewController {
    
    // MARK: - IBOutlets

    
    // MARK: - Private Properties
    
    
    //MARK: - Override Func
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVS = segue.destination as? SettingViewController else {
            return
        }
        settingVS.color = view.backgroundColor
    }
    

    // MARK: - IBActions
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue) {
        guard let settingVS = segue.source as? SettingViewController else {
            return
        }
        view.backgroundColor = settingVS.colorView.backgroundColor
    }
    
    
    // MARK: - User Interface

}
