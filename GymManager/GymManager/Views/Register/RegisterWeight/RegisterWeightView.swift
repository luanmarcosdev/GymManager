//
//  RegisterWeightView.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterWeightView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: RegisterWeightViewDelegate?
    
    func setDelegate(delegate: RegisterWeightViewDelegate?, pvDataSource: UIPickerViewDataSource, pvDelegate: UIPickerViewDelegate){
        self.delegate = delegate
        self.weightPickerView.delegate = pvDelegate
        self.weightPickerView.dataSource = pvDataSource
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Qual é o seu peso? (kg)"
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = UIFont(name: CustomFont.robotBold, size: 24)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var weightPickerView: HorizontalPickerView = {
        let pv = HorizontalPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    lazy var weightImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Weight")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "BackRegisterButton"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var nextButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Proximo", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedNextButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Buttons
    
    @objc func tappedNextButton(){
        self.delegate?.actionNext()
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.weightPickerView)
        self.addSubview(self.weightImage)
        self.addSubview(self.backButton)
        self.addSubview(self.nextButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.weightPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.weightPickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.weightPickerView.heightAnchor.constraint(equalToConstant: 300),
            self.weightPickerView.widthAnchor.constraint(equalToConstant: 113),
            
            self.weightImage.topAnchor.constraint(equalTo: self.weightPickerView.bottomAnchor, constant: -90),
            self.weightImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.weightImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.nextButton.widthAnchor.constraint(equalToConstant: 132),
            self.nextButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.nextButton.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
            
            
        ])
    }
}
