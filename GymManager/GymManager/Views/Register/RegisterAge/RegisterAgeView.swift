//
//  RegisterAgeView.swift
//  GymManager
//
//  Created by Luan Arruda on 09/05/24.
//

import UIKit

class RegisterAgeView: UIView {
    
    //MARK: Delegate
    
    private weak var delegate: RegisterAgeViewDelegate?
    
    func setDelegate(delegate: RegisterAgeViewDelegate?, pvDataSource: UIPickerViewDataSource, pvDelegate: UIPickerViewDelegate){
        self.delegate = delegate
        self.agePickerView.delegate = pvDelegate
        self.agePickerView.dataSource = pvDataSource
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Quantos anos você tem?"
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = UIFont(name: CustomFont.robotBold, size: 24)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "BackRegisterButton"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var agePickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.backgroundColor = .none
        return pv
    }()
    
    lazy var lineTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        return view
    }()
    
    lazy var lineBot: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        return view
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
        self.addSubview(self.backButton)
        self.addSubview(self.agePickerView)
        self.addSubview(self.lineTop)
        self.addSubview(self.lineBot)
        self.addSubview(self.nextButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.nextButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.nextButton.widthAnchor.constraint(equalToConstant: 132),
            self.nextButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.agePickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.agePickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.agePickerView.heightAnchor.constraint(equalToConstant: 350),
            self.agePickerView.widthAnchor.constraint(equalToConstant: 113),
            
            self.lineTop.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lineTop.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -39),
            self.lineTop.heightAnchor.constraint(equalToConstant: 1),
            self.lineTop.widthAnchor.constraint(equalToConstant: 113),
            
            self.lineBot.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lineBot.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 39),
            self.lineBot.heightAnchor.constraint(equalToConstant: 1),
            self.lineBot.widthAnchor.constraint(equalToConstant: 113),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.nextButton.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
            
            
        ])
    }
}
