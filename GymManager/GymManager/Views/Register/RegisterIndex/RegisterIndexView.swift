//
//  RegisterIndexView.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import Foundation
import UIKit

class RegisterIndexView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: RegisterIndexViewDelegate?
    
    func setDelegate(delegate: RegisterIndexViewDelegate?, tfDelegate: UITextFieldDelegate){
        self.delegate = delegate
        self.nameTextField.delegate = tfDelegate
        self.emailTextField.delegate = tfDelegate
        self.passwordTextField.delegate = tfDelegate
    }
    
    //MARK: Elements
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RegisterBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "BackButton"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Bem-vindo!"
        lb.font = UIFont(name: CustomFont.robotBold, size: 32)
        lb.textColor = CustomColor.white
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Entre com suas informações para criar uma nova conta."
        lb.font = UIFont(name: CustomFont.robotRegular, size: 14)
        lb.textColor = CustomColor.white
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Nome"
        tf.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .default
        return tf
    }()
    
    lazy var lineNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var lineEmailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Senha"
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var linePasswordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var registerButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Continuar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.gray
        bt.isEnabled = false
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Buttons
    
    @objc func tappedRegisterButton(){
        self.delegate?.actionRegister()
    }
    
    @objc func tappedBackButton(){
        self.delegate?.actionBack()
    }
    
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
        self.addSubview(self.backButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.lineNameView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.lineEmailView)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.linePasswordView)
        self.addSubview(self.registerButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -127),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.subtitleLabel.widthAnchor.constraint(equalToConstant: 207),

            self.registerButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 48),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            self.linePasswordView.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor, constant: -80),
            self.linePasswordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.linePasswordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.linePasswordView.heightAnchor.constraint(equalToConstant: 1),
            
            self.passwordTextField.bottomAnchor.constraint(equalTo: self.linePasswordView.topAnchor),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.linePasswordView.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.linePasswordView.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineEmailView.bottomAnchor.constraint(equalTo: self.passwordTextField.topAnchor, constant: -20),
            self.lineEmailView.leadingAnchor.constraint(equalTo: self.linePasswordView.leadingAnchor),
            self.lineEmailView.trailingAnchor.constraint(equalTo: self.linePasswordView.trailingAnchor),
            self.lineEmailView.heightAnchor.constraint(equalTo: self.linePasswordView.heightAnchor),
            
            self.emailTextField.bottomAnchor.constraint(equalTo: self.lineEmailView.topAnchor),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.lineEmailView.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.lineEmailView.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineNameView.bottomAnchor.constraint(equalTo: self.emailTextField.topAnchor, constant: -20),
            self.lineNameView.leadingAnchor.constraint(equalTo: self.linePasswordView.leadingAnchor),
            self.lineNameView.trailingAnchor.constraint(equalTo: self.linePasswordView.trailingAnchor),
            self.lineNameView.heightAnchor.constraint(equalTo: self.linePasswordView.heightAnchor),
            
            self.nameTextField.bottomAnchor.constraint(equalTo: self.lineNameView.topAnchor),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.lineEmailView.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.lineEmailView.trailingAnchor),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
}
