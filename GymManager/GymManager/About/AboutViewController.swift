//
//  AboutViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class AboutViewController: UIViewController {
    
    var coordinator: AboutCoordinator?
    
    var aboutView: AboutView?
    
    override func loadView() {
        self.aboutView = AboutView()
        self.view = self.aboutView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutView?.setDelegate(delegate: self)
    }

}

extension AboutViewController: AboutViewDelegate {
    
    func actionBack() {
        self.coordinator?.back()
    }
    
    
}
