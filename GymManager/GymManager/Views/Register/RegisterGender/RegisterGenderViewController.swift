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
    var registerGenderViewModel: RegisterGenderViewModel?
    var genderSelected: Gender?
    
    override func loadView() {
        self.registerGenderView = RegisterGenderView()
        self.view = self.registerGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerGenderView?.setDelegate(delegate: self)
        self.registerGenderViewModel = RegisterGenderViewModel()
        self.registerGenderViewModel?.insertUserNameInLabel(label: self.registerGenderView!.titleLabel)
    }

}

extension RegisterGenderViewController: RegisterGenderDelegate {
   
    func actionNext() {
        guard let gender = self.genderSelected else {return}
        
        self.registerGenderViewModel?.buildGender(gender: gender, OnSucess: {
            self.coordinator?.navigationToRegisterAgeScreen()
        })
    }
        
    func actionMan() {
        let genderSelected = self.registerGenderViewModel?.selectedGenderButton(manButton: self.registerGenderView!.manButton, womanButton: self.registerGenderView!.womanButton, gender: .man, enableButton: registerGenderView!.nextButton)
        
        self.genderSelected = genderSelected
    }
    
    func actionWoman() {
        let genderSelected = self.registerGenderViewModel?.selectedGenderButton(manButton: self.registerGenderView!.manButton, womanButton: self.registerGenderView!.womanButton, gender: .woman, enableButton: registerGenderView!.nextButton)
        
        self.genderSelected = genderSelected
    }
    
}
