//
//  HorizontalPickerView.swift
//  GymManager
//
//  Created by Luan Arruda on 22/05/24.
//

import Foundation
import UIKit

class HorizontalPickerView: UIPickerView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.transform = CGAffineTransform(rotationAngle: -90 * (.pi/180))
    }
    
    override func selectRow(_ row: Int, inComponent component: Int, animated: Bool) {
        super.selectRow(row, inComponent: component, animated: animated)
        
        if let view = self.view(forRow: row, forComponent: component) {
            view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        }
        
    }
    
    override func view(forRow row: Int, forComponent component: Int) -> UIView? {
        let view = super.view(forRow: row, forComponent: component)
        view?.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return view
    }
}
