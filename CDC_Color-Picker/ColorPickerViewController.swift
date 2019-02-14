//
//  ColorPickerViewController.swift
//  CDC_Color-Picker
//
//  Created by lpiem on 24/01/2019.
//  Copyright © 2019 sge-groupama-fdj. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    //Ecouteur
    var delegate: ColorPickerViewDelegate?
    
    @IBAction func greenButtonTouched() {
        delegate?.userDidChooseColor(ColorAsset.green.color)
    }
    
    @IBAction func orangeButtonTouched() {
        delegate?.userDidChooseColor(ColorAsset.orange.color)
    }
    
    @IBAction func purpleButtonTouched() {
        delegate?.userDidChooseColor(ColorAsset.purple.color)
    }
}

protocol ColorPickerViewDelegate {
    func userDidChooseColor(_ color: UIColor)
}
