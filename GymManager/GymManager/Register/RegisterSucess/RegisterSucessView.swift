//
//  RegisterSucess.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterSucessView: UIView {

    //MARK: Delegate
    
    private weak var delegate: RegisterGoalViewDelegate?
    
    func setDelegate(delegate: RegisterGoalViewDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var logoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "dumbbell")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Conta criada com sucesso!"
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = UIFont(name: CustomFont.robotBold, size: 17)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "O primeiro passo pode ser o mais difícil, mas também é o mais corajoso."
        lb.font = UIFont(name: CustomFont.robotRegular, size: 14)
        lb.textColor = CustomColor.green
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var finishButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Ok", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 14)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedFinishButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Buttons
    
    @objc func tappedFinishButton(){
        self.delegate?.actionFinish()
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
        self.addSubview(self.containerView)
        self.addSubview(self.logoView)
        self.logoView.addSubview(self.logoImageView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.subtitleLabel)
        self.containerView.addSubview(self.finishButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.containerView.heightAnchor.constraint(equalToConstant: 197),
            
            self.logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoView.heightAnchor.constraint(equalToConstant: 80),
            self.logoView.widthAnchor.constraint(equalToConstant: 80),
            self.logoView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: -40),
            
            self.logoImageView.centerXAnchor.constraint(equalTo: self.logoView.centerXAnchor),
            self.logoImageView.centerYAnchor.constraint(equalTo: self.logoView.centerYAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 15),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            self.subtitleLabel.widthAnchor.constraint(equalToConstant: 265),
            
            self.finishButton.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 16),
            self.finishButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.finishButton.widthAnchor.constraint(equalToConstant: 120),
            self.finishButton.heightAnchor.constraint(equalToConstant: 44)
            
            
        ])
    }

}
