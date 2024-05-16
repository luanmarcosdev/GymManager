//
//  RegisterGenderView.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterGenderView: UIView {

    //MARK: Delegate
    
    private weak var delegate: RegisterGenderDelegate?
    
    func setDelegate(delegate: RegisterGenderDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Olá, Luan Marcos Arruda Silva"
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = UIFont(name: CustomFont.robotBold, size: 24)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Para proporcionarmos uma melhor experiência precisamos saber algumas coisas sobre você. Isso nos ajuda a personalizar sua conta."
        lb.font = UIFont(name: CustomFont.robotExtraLight, size: 14)
        lb.textColor = CustomColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var manButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "Man"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedManButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var womanButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "Woman"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedWomanButton), for: .touchUpInside)
        return bt
    }()
        
    lazy var nextButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Proximo", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.gray
        bt.isEnabled = false
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedNextButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Buttons
    
    @objc func tappedNextButton(){
        self.delegate?.actionNext()
    }
    
    @objc func tappedManButton(){
        self.delegate?.actionMan()
    }
    
    @objc func tappedWomanButton(){
        self.delegate?.actionWoman()
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
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.manButton)
        self.addSubview(self.womanButton)
        self.addSubview(self.nextButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 320),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subtitleLabel.widthAnchor.constraint(equalToConstant: 340),
            
            self.nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.nextButton.widthAnchor.constraint(equalToConstant: 132),
            self.nextButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.manButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -90),
            self.manButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.womanButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 90),
            self.womanButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            
        ])
    }

}
