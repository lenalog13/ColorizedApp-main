//
//  ColorViewController.swift
//  ColorSetting
//
//  Created by Елена Логинова on 30.01.2023.
//

import UIKit


protocol SettingViewControllerDelegate {
    func setColor(_ color: UIColor)
}

final class ColorViewController: UIViewController {
    
    //MARK: - Override Func
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVS = segue.destination as? SettingViewController else {
            return
        }
        settingVS.color = view.backgroundColor
        settingVS.delegate = self
    }
}

//MARK: - SettingViewControllerDelegate

extension ColorViewController: SettingViewControllerDelegate {
    
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
