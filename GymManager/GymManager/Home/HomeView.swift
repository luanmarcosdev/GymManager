//
//  HomeView.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class HomeView: UIView {

    //MARK: Delegate
    
    private weak var delegate: HomeViewDelegate?
    
    func setDelegate(delegate: HomeViewDelegate?) {
        self.delegate = delegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Olá Fulano,"
        lb.font = UIFont(name: CustomFont.robotBlack, size: 32)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Bora treinar?"
        lb.font = UIFont(name: CustomFont.robotRegular, size: 15)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var userButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "UserDefault"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedUserButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var worksheetsLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Fichas de treino"
        lb.font = UIFont(name: CustomFont.robotRegular, size: 17)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var addWorksheetsButton:  UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Adicionar ficha", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 13)
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(self.tappedAddWorksheetButton), for: .touchUpInside)
        return bt
    }()
    
    // to do fichas
    
    lazy var goalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Meta"
        return lb
    }()
    
    lazy var editGoalButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    lazy var descriptionGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "É preciso impor a si mesmo algumas metas para se ter a coragem de alcançá-las."
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var emphasisGoalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emphasisTitleGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Treinos concluídos"
        return lb
    }()
    
    lazy var emphasisSubtitleGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Você já bateu 25% da sua meta (12). Faltam 9 treinos para completá-la."
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var emphasisNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emphasisNumberLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "3"
        return lb
    }()
    
    lazy var addActivityButton: UIButton = {
        let bt = UIButton()
        return bt
    }()
    
    lazy var assessmentsButton: UIButton = {
        let bt = UIButton()
        return bt
    }()
    
    //MARK: Action Button
    
    @objc func tappedUserButton() {
        self.delegate?.actionUserButton()
    }
    
    @objc func tappedAddWorksheetButton() {
        self.delegate?.actionAddWorksheets()
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
        self.addSubview(self.userButton)
        self.addSubview(self.worksheetsLabel)
        self.addSubview(self.addWorksheetsButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            self.userButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.userButton.topAnchor.constraint(equalTo: self.titleLabel.topAnchor),
            self.userButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            
            self.worksheetsLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.worksheetsLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 32),
            
            self.addWorksheetsButton.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.addWorksheetsButton.centerYAnchor.constraint(equalTo: self.worksheetsLabel.centerYAnchor)
            
        ])
    }

    
}
