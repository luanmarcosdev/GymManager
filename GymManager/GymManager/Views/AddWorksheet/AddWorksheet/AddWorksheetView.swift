//
//  AddWorksheetView.swift
//  GymManager
//
//  Created by Luan Arruda on 05/06/24.
//

import UIKit

class AddWorksheetView: UIView {
    
    //MARK: Delegate
    
    private var delegete: AddWorksheetViewDelegate?
    
    func setDelegate(delegate: AddWorksheetViewDelegate, tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, tfDelegate: UITextFieldDelegate) {
        self.delegete = delegate
        self.exercisesTableView.delegate = tableViewDelegate
        self.exercisesTableView.dataSource = tableViewDataSource
        self.idTextField.delegate = tfDelegate
        self.descriptionTextField.delegate = tfDelegate
    }
    
    //MARK: Elements
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar Ficha"
        label.textColor = CustomColor.white
        label.font = UIFont(name: CustomFont.robotBold, size: 20)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "BackButton"), for: .normal)
        bt.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var idTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Idenficação da ficha"
        tf.attributedPlaceholder = NSAttributedString(string: "Idenficação da ficha", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .default
        return tf
    }()
    
    lazy var lineIdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Descrição"
        tf.attributedPlaceholder = NSAttributedString(string: "Descrição", attributes: [NSAttributedString.Key.foregroundColor: CustomColor.white])
        tf.backgroundColor = .clear
        tf.font = UIFont(name: CustomFont.robotExtraLight, size: 17)
        tf.textColor = CustomColor.white
        tf.borderStyle = .none
        tf.keyboardType = .default
        return tf
    }()
    
    lazy var lineDescriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var addButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("+ Adicionar exercício", for: .normal)
        bt.setTitleColor(CustomColor.green, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotRegular, size: 16)
        bt.backgroundColor = .none
        bt.addTarget(self, action: #selector(self.tappedAddExerciseButton), for: .touchUpInside)
        return bt
    }()
    
    lazy var exercisesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    lazy var saveButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Salvar ficha", for: .normal)
        bt.setTitleColor(CustomColor.black, for: .normal)
        bt.titleLabel?.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        bt.backgroundColor = CustomColor.gray
        bt.isEnabled = false
        bt.isEnabled = true
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 24
        bt.addTarget(self, action: #selector(self.tappedSaveButton), for: .touchUpInside)
        return bt
    }()
    
    //MARK: Action Button
    
    @objc func tappedBackButton() {
        self.delegete?.actionBack()
    }
    
    @objc func tappedAddExerciseButton() {
        self.delegete?.actionAddExercise()
    }
    
    @objc func tappedSaveButton() {
        self.delegete?.actionSaveButton()
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
        self.addSubview(self.backButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.idTextField)
        self.addSubview(self.lineIdView)
        self.addSubview(self.descriptionTextField)
        self.addSubview(self.lineDescriptionView)
        self.addSubview(self.addButton)
        self.addSubview(self.exercisesTableView)
        self.addSubview(self.saveButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            self.backButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.idTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.idTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.idTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineIdView.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor),
            self.lineIdView.heightAnchor.constraint(equalToConstant: 1),
            self.lineIdView.leadingAnchor.constraint(equalTo: self.idTextField.leadingAnchor),
            self.lineIdView.trailingAnchor.constraint(equalTo: self.idTextField.trailingAnchor),
            
            self.descriptionTextField.topAnchor.constraint(equalTo: self.lineIdView.bottomAnchor, constant: 20),
            self.descriptionTextField.leadingAnchor.constraint(equalTo: self.idTextField.leadingAnchor),
            self.descriptionTextField.trailingAnchor.constraint(equalTo: self.idTextField.trailingAnchor),
            self.descriptionTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.lineDescriptionView.topAnchor.constraint(equalTo: self.descriptionTextField.bottomAnchor),
            self.lineDescriptionView.heightAnchor.constraint(equalToConstant: 1),
            self.lineDescriptionView.leadingAnchor.constraint(equalTo: self.idTextField.leadingAnchor),
            self.lineDescriptionView.trailingAnchor.constraint(equalTo: self.idTextField.trailingAnchor),
            
            self.addButton.topAnchor.constraint(equalTo: self.lineDescriptionView.bottomAnchor, constant: 20),
            self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.exercisesTableView.topAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 20),
            self.exercisesTableView.leadingAnchor.constraint(equalTo: self.idTextField.leadingAnchor),
            self.exercisesTableView.trailingAnchor.constraint(equalTo: self.idTextField.trailingAnchor),
            self.exercisesTableView.bottomAnchor.constraint(equalTo: self.saveButton.topAnchor, constant: -20),
            
            self.saveButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.saveButton.heightAnchor.constraint(equalToConstant: 48),
            self.saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
        ])
    }
    
}
