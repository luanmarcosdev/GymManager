//
//  IndexView.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class IndexView: UIView {
    
    //MARK: Elements
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        let randomImage = randomImage(imageName: "IndexBackground", maxNumber: 2)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: randomImage)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Constância é a chave para o sucesso"
        lb.textColor = CustomColor.white
        lb.font = UIFont(name: CustomFont.robotSemiBold, size: 24)
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        return bt
    }()
    
    lazy var registerButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Cadastrar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.blue
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        return bt
    }()
    
    lazy var aboutButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Sobre o Gym Manager", for: .normal)
        bt.setTitleColor(CustomColor.white, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 14)
        bt.backgroundColor = .none
        return bt
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.aboutButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor,constant: -40),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            self.loginButton.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor, constant: -20),
            self.loginButton.heightAnchor.constraint(equalToConstant: 48),
            self.loginButton.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.aboutButton.topAnchor, constant: -60),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor),
            self.registerButton.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            
            self.aboutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.aboutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
    
        ])
    }
    
}
