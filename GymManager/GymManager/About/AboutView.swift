//
//  AboutView.swift
//  GymManager
//
//  Created by Luan Arruda on 07/05/24.
//

import UIKit

class AboutView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: AboutViewDelegate?
    
    func setDelegate(delegate: AboutViewDelegate?){
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Sobre o Gym Manager"
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
        lb.text = CustomText.about
        lb.textColor = CustomColor.graySecondary
        lb.font = UIFont(name: CustomFont.robotRegular, size: 15)
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    //MARK: Action Button
    
    @objc func tappedBackButton() {
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.backButton)
        self.addSubview(self.textLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.textLabel.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 32),
            self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
            
        ])
    }

}
