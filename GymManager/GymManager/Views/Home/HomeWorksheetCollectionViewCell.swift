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
    
    lazy var worksheetImage: UIImageView = {
        let bt = UIImageView()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.image = UIImage(named: "Card")
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
        self.addSubview(self.worksheetImage)
        self.worksheetImage.addSubview(self.worksheetTitleLabel)
        self.worksheetImage.addSubview(self.worksheetDescriptionLabel)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.worksheetImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.worksheetImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.worksheetImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.worksheetImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.worksheetDescriptionLabel.bottomAnchor.constraint(equalTo: self.worksheetImage.bottomAnchor, constant: -16),
            self.worksheetDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            self.worksheetTitleLabel.leadingAnchor.constraint(equalTo: self.worksheetDescriptionLabel.leadingAnchor),
            self.worksheetTitleLabel.bottomAnchor.constraint(equalTo: self.worksheetDescriptionLabel.topAnchor, constant: -6)
            
        ])
    }
    
}
