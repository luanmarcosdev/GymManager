//
//  HomeWorksheetCollectionViewCell.swift
//  GymManager
//
//  Created by Luan Arruda on 13/05/24.
//

import UIKit

class HomeWorksheetCollectionViewCell: UICollectionViewCell {
    
    //MARK: Identifier
    
    static let identifier: String = "HomeWorksheetCollectionViewCell"
    
    //MARK: Elements
    
    lazy var worksheetButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setImage(UIImage(named: "Card"), for: .normal)
        return bt
    }()

    lazy var worksheetTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Ficha A"
        lb.font = UIFont(name: CustomFont.robotSemiBold, size: 17)
        lb.textColor = CustomColor.white
        return lb
    }()
    
    lazy var worksheetDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Membros superiores"
        lb.font = UIFont(name: CustomFont.robotSemiBold, size: 13)
        lb.textColor = CustomColor.green
        return lb
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setting elements
    
    func configSuperView() {
        self.addSubview(self.worksheetButton)
        self.worksheetButton.addSubview(self.worksheetTitleLabel)
        self.worksheetButton.addSubview(self.worksheetDescriptionLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.worksheetButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.worksheetButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.worksheetButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.worksheetButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.worksheetDescriptionLabel.bottomAnchor.constraint(equalTo: self.worksheetButton.bottomAnchor, constant: -16),
            self.worksheetDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.worksheetTitleLabel.leadingAnchor.constraint(equalTo: self.worksheetDescriptionLabel.leadingAnchor),
            self.worksheetTitleLabel.bottomAnchor.constraint(equalTo: self.worksheetDescriptionLabel.topAnchor, constant: -6)
            
        ])
    }
    
}
