//
//  EditGoalView.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import UIKit

class EditGoalView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: EditGoalViewDelegate?
    
    func setDelegate(delegate: EditGoalViewDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Editar meta"
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
        lb.text = "Edite sua meta e se mantenha motivado"
        lb.textAlignment = .center
        lb.textColor = CustomColor.graySecondary
        lb.font = UIFont(name: CustomFont.robotRegular, size: 13)
        return lb
    }()
    
    lazy var goalTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua nova meta"
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua nova meta", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .numberPad
        return tf
    }()
    
    lazy var lineGoalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var confirmButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Confirmar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedConfirmButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Button
    
    @objc func tappedBackButton() {
        self.delegate?.actionBack()
    }
    
    @objc func tappedConfirmButton() {
        self.delegate?.actionConfirm()
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
        self.addSubview(self.goalTextField)
        self.addSubview(self.lineGoalView)
        self.addSubview(self.confirmButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.textLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 32),
            self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.goalTextField.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: 20),
            self.goalTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.goalTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.goalTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineGoalView.topAnchor.constraint(equalTo: self.goalTextField.bottomAnchor),
            self.lineGoalView.leadingAnchor.constraint(equalTo: self.goalTextField.leadingAnchor),
            self.lineGoalView.trailingAnchor.constraint(equalTo: self.goalTextField.trailingAnchor),
            self.lineGoalView.heightAnchor.constraint(equalToConstant: 1),
            
            self.confirmButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 48),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
        ])
    }
    
    
    
    
}
