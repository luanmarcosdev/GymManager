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
    
    func setDelegate(delegate: LoginViewDelegate?, TFDelegate: UITextFieldDelegate?){
        self.delegate = delegate
        self.emailTextField.delegate = TFDelegate
        self.passwordTextField.delegate = TFDelegate
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
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Bem-vindo novamente!"
        lb.font = UIFont(name: CustomFont.robotRegular, size: 36)
        lb.textColor = CustomColor.white
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
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
        bt.setTitle("Não tem conta?", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 13)
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var forgotButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Esqueci a senha", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 13)
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(self.tappedForgotButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.gray
        bt.isEnabled = false
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Buttons
    
    @objc func tappedRegisterButton(){
        self.delegate?.registerButton()
    }
    
    @objc func tappedForgotButton(){
        self.delegate?.forgotButton()
    }
    
    @objc func tappedLoginButton(){
        self.delegate?.loginButton()
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.lineEmailView)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.linePasswordView)
        self.addSubview(self.registerButton)
        self.addSubview(self.forgotButton)
        self.addSubview(self.loginButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -76),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 258),
            
            self.loginButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 48),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        
            self.registerButton.bottomAnchor.constraint(equalTo: self.loginButton.topAnchor, constant: -50),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            
            self.forgotButton.centerYAnchor.constraint(equalTo: self.registerButton.centerYAnchor),
            self.forgotButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            
            self.linePasswordView.bottomAnchor.constraint(equalTo: self.registerButton.topAnchor, constant: -20),
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
            self.emailTextField.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
}
