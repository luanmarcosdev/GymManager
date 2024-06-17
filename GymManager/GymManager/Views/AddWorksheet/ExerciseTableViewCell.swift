//
//  ExerciseTableViewCell.swift
//  GymManager
//
//  Created by Luan Arruda on 17/06/24.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    static let identifier = "ExerciseTableViewCell"
    
    // MARK: Elements
    
    lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = CustomColor.darkSecondary
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CustomFont.robotBold, size: 12)
        label.textColor = CustomColor.white
        return label
    }()
    
    lazy var weightContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.green
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: CustomFont.robotBold, size: 12)
        label.textColor = CustomColor.black
        return label
    }()
    
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configViewBackgroundColor()
        self.configSuperView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    //MARK: Setting elements
    
    private func configViewBackgroundColor() {
        self.backgroundColor = .clear
    }
    
    private func configSuperView() {
        self.contentView.addSubview(self.cellBackgroundView)
//        self.contentView.addSubview(self.nameLabel)
//        self.contentView.addSubview(self.weightContainerView)
//        self.contentView.addSubview(self.weightLabel)
        self.cellBackgroundView.addSubview(nameLabel)
        self.cellBackgroundView.addSubview(weightContainerView)
        self.weightContainerView.addSubview(weightLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            self.cellBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.cellBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.cellBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cellBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.nameLabel.leadingAnchor.constraint(equalTo: self.cellBackgroundView.leadingAnchor, constant: 17),
            self.nameLabel.centerYAnchor.constraint(equalTo: self.cellBackgroundView.centerYAnchor),
            
            self.weightContainerView.trailingAnchor.constraint(equalTo: self.cellBackgroundView.trailingAnchor, constant: -17),
            self.weightContainerView.centerYAnchor.constraint(equalTo: self.cellBackgroundView.centerYAnchor),
            self.weightContainerView.heightAnchor.constraint(equalToConstant: 24),
            self.weightContainerView.widthAnchor.constraint(equalToConstant: 34),
            
            self.weightLabel.centerXAnchor.constraint(equalTo: self.weightContainerView.centerXAnchor),
            self.weightLabel.centerYAnchor.constraint(equalTo: self.weightContainerView.centerYAnchor)
        
        ])
    }
    
}
