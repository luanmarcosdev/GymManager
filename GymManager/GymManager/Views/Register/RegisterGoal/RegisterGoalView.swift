//
//  RegisterGoal.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class RegisterGoalView: UIView {

    //MARK: Delegate
    
    private weak var delegate: RegisterGoalViewDelegate?
    
    func setDelegate(delegate: RegisterGoalViewDelegate?, pvDataSource: UIPickerViewDataSource, pvDelegate: UIPickerViewDelegate){
        self.delegate = delegate
        self.goalPickerView.dataSource = pvDataSource
        self.goalPickerView.delegate = pvDelegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Qual sua meta de treino/ mês?"
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.font = UIFont(name: CustomFont.robotBold, size: 24)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var goalPickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var selectedRowLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "x"
        lb.font = UIFont(name: CustomFont.robotBlack, size: 17)
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
    
    lazy var finishButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Finalizar", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.goalPickerView)
        self.addSubview(self.lineTop)
        self.addSubview(self.lineBot)
        self.addSubview(self.selectedRowLabel)
        self.addSubview(self.backButton)
        self.addSubview(self.finishButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.goalPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.goalPickerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.goalPickerView.heightAnchor.constraint(equalToConstant: 350),
            self.goalPickerView.widthAnchor.constraint(equalToConstant: 113),
            
            self.lineTop.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lineTop.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -39),
            self.lineTop.heightAnchor.constraint(equalToConstant: 1),
            self.lineTop.widthAnchor.constraint(equalToConstant: 113),
            
            self.lineBot.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.lineBot.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 39),
            self.lineBot.heightAnchor.constraint(equalToConstant: 1),
            self.lineBot.widthAnchor.constraint(equalToConstant: 113),
            
            self.selectedRowLabel.bottomAnchor.constraint(equalTo: self.lineBot.topAnchor, constant: -13),
            self.selectedRowLabel.leadingAnchor.constraint(equalTo: self.goalPickerView.trailingAnchor),
                        
            self.finishButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.finishButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.finishButton.widthAnchor.constraint(equalToConstant: 132),
            self.finishButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.finishButton.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
            
            
        ])
    }
    
}
