//
//  ForgotView.swift
//  GymManager
//
//  Created by Luan Arruda on 08/05/24.
//

import UIKit

class ForgotView: UIView {

    //MARK: Delegate
    
    private weak var delegate: ForgotViewDelegate?
    
    func setDelegate(delegate: ForgotViewDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Recupere sua conta"
        lb.textColor = CustomColor.white
        lb.font = UIFont(name: CustomFont.robotBold, size: 20)
        return lb
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "BackButton"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var textLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Entre com seu email para recuperar a conta."
        lb.textAlignment = .center
        lb.textColor = CustomColor.graySecondary
        lb.font = UIFont(name: CustomFont.robotRegular, size: 13)
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
    
    lazy var recoveyButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Recuperar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedRecoveryButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Button
    
    @objc func tappedBackButton() {
        self.delegate?.actionBack()
    }
    
    @objc func tappedRecoveryButton() {
        self.delegate?.actionRecovery()
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.backButton)
        self.addSubview(self.textLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.lineEmailView)
        self.addSubview(self.recoveyButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.textLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 32),
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineEmailView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor),
            self.lineEmailView.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.lineEmailView.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.lineEmailView.heightAnchor.constraint(equalToConstant: 1),
            
            self.recoveyButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.recoveyButton.heightAnchor.constraint(equalToConstant: 48),
            self.recoveyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.recoveyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
        ])
    }

}
