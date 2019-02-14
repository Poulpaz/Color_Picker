//
//  ViewController.swift
//  CDC_Color-Picker
//
//  Created by lpiem on 24/01/2019.
//  Copyright © 2019 sge-groupama-fdj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backColor: UIColor = ColorAsset.green.color
    
    //Etape 1 : Button to ColorPickerVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Etape 2 : récuperer l'identifiant du Button
        if segue.identifier == "pickColor" {
            //Etape 3 : récuperer la destination
            let destVC = segue.destination as! ColorPickerViewController
            //Etap 4 : changement de controlleur
            destVC.delegate = self
        }
    }
}

extension ViewController: ColorPickerViewDelegate {
    func userDidChooseColor(_ color: UIColor) {
        dismiss(animated: true, completion: {
            //self.view.backgroundColor = color
            UIView.animate(withDuration:2, animations: { self.view.backgroundColor = color })
        })
        let alert = UIAlertController(title: "Confirmation", message: "Voulez-vous conserver cette couleur ?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in self.backColor = color }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {
            _ in UIView.animate(withDuration:2, animations: { self.view.backgroundColor = self.backColor } )
        }))
        self.present(alert, animated: true)
    }
}
