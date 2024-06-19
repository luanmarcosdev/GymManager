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
    
    func setDelegate(delegate: HomeViewDelegate?, collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource) {
        self.delegate = delegate
        self.collectionView.delegate = collectionViewDelegate
        self.collectionView.dataSource = collectionViewDataSource
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Gym Manager"
        lb.font = UIFont(name: CustomFont.robotBold, size: 32)
        lb.textColor = CustomColor.green
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
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = true
        cv.delaysContentTouches = false
        cv.backgroundColor = .none
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.indicatorStyle = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(HomeWorksheetCollectionViewCell.self, forCellWithReuseIdentifier: HomeWorksheetCollectionViewCell.identifier)
        return cv
        }()
    
    lazy var goalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Meta"
        lb.font = UIFont(name: CustomFont.robotRegular, size: 17)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var editGoalButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Editar meta", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 13)
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(self.tappedEditGoalButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var descriptionGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "É preciso impor a si mesmo algumas metas para se ter a coragem de alcançá-las."
        lb.font = UIFont(name: CustomFont.robotRegular, size: 15)
        lb.textColor = CustomColor.white
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var emphasisGoalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var emphasisTitleGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Treinos concluídos"
        lb.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var emphasisSubtitleGoalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Você já bateu 25% da sua meta (12). Faltam 9 treinos para completá-la."
        lb.font = UIFont(name: CustomFont.robotRegular, size: 13)
        lb.textColor = CustomColor.green
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        return lb
    }()
    
    lazy var emphasisNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var emphasisNumberLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "3"
        lb.textColor = CustomColor.black
        lb.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        return lb
    }()
    
    lazy var addActivityButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Registrar treino", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.green
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedAddActivityButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var assessmentsButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Avaliações", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.darkSecondary
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedAssessmentButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Button
    
    @objc func tappedUserButton() {
        self.delegate?.actionUserButton()
    }
    
    @objc func tappedAddWorksheetButton() {
        self.delegate?.actionAddWorksheets()
    }
    
    @objc func tappedEditGoalButton() {
        self.delegate?.actionEditGoal()
    }
    
    @objc func tappedAddActivityButton () {
        self.delegate?.actionAddActivity()
    }
    
    @objc func tappedAssessmentButton() {
        self.delegate?.actionAssessments()
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
        self.addSubview(self.collectionView)
        self.addSubview(self.goalLabel)
        self.addSubview(self.editGoalButton)
        self.addSubview(self.descriptionGoalLabel)
        self.addSubview(self.emphasisGoalView)
        self.emphasisGoalView.addSubview(self.emphasisTitleGoalLabel)
        self.emphasisGoalView.addSubview(self.emphasisSubtitleGoalLabel)
        self.emphasisGoalView.addSubview(self.emphasisNumberView)
        self.emphasisNumberView.addSubview(self.emphasisNumberLabel)
        self.addSubview(self.addActivityButton)
        self.addSubview(self.assessmentsButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            
            self.userButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
//            self.userButton.heightAnchor.constraint(equalToConstant: 24),
//            self.userButton.widthAnchor.constraint(equalToConstant: 24),
            self.userButton.topAnchor.constraint(equalTo: self.titleLabel.topAnchor),
            self.userButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            
            self.worksheetsLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.worksheetsLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 32),
            
            self.addWorksheetsButton.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.addWorksheetsButton.centerYAnchor.constraint(equalTo: self.worksheetsLabel.centerYAnchor),
            
            self.collectionView.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.worksheetsLabel.bottomAnchor, constant: 15),
            self.collectionView.heightAnchor.constraint(equalToConstant: 160),
            
            self.goalLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.goalLabel.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 32),
            
            self.editGoalButton.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.editGoalButton.centerYAnchor.constraint(equalTo: self.goalLabel.centerYAnchor),
            
            self.descriptionGoalLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.descriptionGoalLabel.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.descriptionGoalLabel.topAnchor.constraint(equalTo: self.goalLabel.bottomAnchor, constant: 15),
            
            self.emphasisGoalView.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.emphasisGoalView.trailingAnchor.constraint(equalTo: self.userButton.trailingAnchor),
            self.emphasisGoalView.heightAnchor.constraint(equalToConstant: 100),
            self.emphasisGoalView.topAnchor.constraint(equalTo: self.descriptionGoalLabel.bottomAnchor, constant: 40),
            
            self.emphasisTitleGoalLabel.leadingAnchor.constraint(equalTo: self.emphasisGoalView.leadingAnchor, constant: 16),
            self.emphasisTitleGoalLabel.topAnchor.constraint(equalTo: self.emphasisGoalView.topAnchor, constant: 16),

            self.emphasisSubtitleGoalLabel.leadingAnchor.constraint(equalTo: self.emphasisTitleGoalLabel.leadingAnchor),
            self.emphasisSubtitleGoalLabel.topAnchor.constraint(equalTo: self.emphasisTitleGoalLabel.bottomAnchor, constant: 8),
            self.emphasisSubtitleGoalLabel.widthAnchor.constraint(equalToConstant: 222),
            
            self.emphasisNumberView.centerYAnchor.constraint(equalTo: self.emphasisGoalView.centerYAnchor),
            self.emphasisNumberView.trailingAnchor.constraint(equalTo: self.emphasisGoalView.trailingAnchor, constant: -16),
            self.emphasisNumberView.widthAnchor.constraint(equalToConstant: 44),
            self.emphasisNumberView.heightAnchor.constraint(equalToConstant: 44),
            
            self.emphasisNumberLabel.centerXAnchor.constraint(equalTo: self.emphasisNumberView.centerXAnchor),
            self.emphasisNumberLabel.centerYAnchor.constraint(equalTo: self.emphasisNumberView.centerYAnchor),
            
            self.addActivityButton.topAnchor.constraint(equalTo: self.emphasisGoalView.bottomAnchor,constant: 40),
            self.addActivityButton.heightAnchor.constraint(equalToConstant: 48),
            self.addActivityButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.addActivityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            self.assessmentsButton.topAnchor.constraint(equalTo: self.addActivityButton.bottomAnchor,constant: 18),
            self.assessmentsButton.heightAnchor.constraint(equalToConstant: 48),
            self.assessmentsButton.leadingAnchor.constraint(equalTo: self.addActivityButton.leadingAnchor),
            self.assessmentsButton.trailingAnchor.constraint(equalTo: self.addActivityButton.trailingAnchor)
        
            
        ])
    }

    
}
