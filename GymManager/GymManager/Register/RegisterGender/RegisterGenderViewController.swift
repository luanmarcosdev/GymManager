//
//  RegisterGenderViewController.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterGenderViewController: UIViewController {
    
    var coordinator: RegisterGenderCoordinator?
    
    var registerGenderView: RegisterGenderView?
    
    override func loadView() {
        self.registerGenderView = RegisterGenderView()
        self.view = self.registerGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerGenderView?.setDelegate(delegate: self)
    }

}

extension RegisterGenderViewController: RegisterGenderDelegate {
   
    func actionNext() {
        print("next")
    }
    
    func actionMan() {
        //just example - to do in ViewModel
        self.registerGenderView?.manButton.setImage(UIImage(named: "ManSelected"), for: .normal)
        self.registerGenderView?.womanButton.setImage(UIImage(named: "Woman"), for: .normal)
        print("man tapped")
    }
    
    func actionWoman() {
        //just example - to do in ViewModel
        self.registerGenderView?.womanButton.setImage(UIImage(named: "WomanSelected"), for: .normal)
        self.registerGenderView?.manButton.setImage(UIImage(named: "Man"), for: .normal)
        print("woman tapped")
    }
    
}
