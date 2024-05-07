//
//  LoginView.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class LoginView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: LoginViewDelegate?
    
    func setDelegate(delegate: LoginViewDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        let randomImage = randomImage(imageName: "LoginBackground", maxNumber: 2)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: randomImage)
        image.contentMode = .scaleAspectFill
        return image
    }()

    //MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViewBackgroundColor()
        self.configSuperView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setting elements
    
    func configViewBackgroundColor() {
        self.backgroundColor = CustomColor.darkMain
    }
    
    func configSuperView() {
        self.addSubview(self.backgroundImage)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
}
