//
//  SegueHandlerType.swift
//  CDC_Color-Picker
//
//  Created by lpiem on 24/01/2019.
//  Copyright © 2019 sge-groupama-fdj. All rights reserved.
//

import Foundation

protocol SegueHandlerType {
    
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: ViewController, SegueIdentifier.RawValue == String {
    
    func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any?) {
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    func segueIdentifier(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Couldn't handle segue identifier \(String(describing: segue.identifier)) for view controller of type \(type(of: self)).")
        }
        return segueIdentifier
    }
}
