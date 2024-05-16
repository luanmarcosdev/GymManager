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
    
    var registerViewModel: RegisterViewModel?
    
    let userBuilder = UserBuilder.shared
    
    var genderSelected: Gender?
    
    override func loadView() {
        self.registerGenderView = RegisterGenderView()
        self.view = self.registerGenderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerGenderView?.setDelegate(delegate: self)
        self.registerViewModel = RegisterViewModel()
        self.registerViewModel?.insertUserNameInLabel(label: self.registerGenderView!.titleLabel, userName: userBuilder.getName())
    }

}

extension RegisterGenderViewController: RegisterGenderDelegate {
   
    func actionNext() {
        self.userBuilder.setGender(gender: genderSelected!)
        self.coordinator?.navigationToRegisterAgeScreen()
    }
        
    func actionMan() {
        let genderSelected = self.registerViewModel?.selectedGenderButton(manButton: self.registerGenderView!.manButton, womanButton: self.registerGenderView!.womanButton, gender: .man, enableButton: registerGenderView!.nextButton)
        
        self.genderSelected = genderSelected
    }
    
    func actionWoman() {
        let genderSelected = self.registerViewModel?.selectedGenderButton(manButton: self.registerGenderView!.manButton, womanButton: self.registerGenderView!.womanButton, gender: .woman, enableButton: registerGenderView!.nextButton)
        
        self.genderSelected = genderSelected
    }
    
}
