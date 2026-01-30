//
//  PatientCardController.swift
//  PatientsManager
//
//  Created by Samad Akram on 29/01/2026.
//

import UIKit

class PatientCardController: UITableViewCell {
    
    static let identifier = "cell"
    
    private let cardView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .systemBlue
        imageView.layer.cornerRadius = 24
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let relationBadge: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemBlue
        label.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageGenderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowRight: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle,
    reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        backgroundView = nil
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(cardView)
        cardView.addSubview(avatarView)
        cardView.addSubview(relationBadge)
        cardView.addSubview(nameLabel)
        cardView.addSubview(ageGenderLabel)
        
        cardView.addSubview(arrowRight)
//        cardView.addSubview(nameLabel)
        
        setupContrainst()
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContrainst() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                    cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                    cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                    cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            avatarView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            avatarView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 48),
            avatarView.heightAnchor.constraint(equalToConstant: 48),
            
            relationBadge.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            relationBadge.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 12),
            relationBadge.heightAnchor.constraint(equalToConstant: 22),
            relationBadge.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: relationBadge.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: relationBadge.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: arrowRight.leadingAnchor, constant: -8),
            
            ageGenderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            ageGenderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageGenderLabel.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -16),
            
            arrowRight.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            arrowRight.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
        ])
    }
    
    func configure(name: String, relation: String, age: Int, gender: String) {
        nameLabel.text = name
        relationBadge.text = " \(relation) "
        ageGenderLabel.text = "\(age) yrs • \(gender)"
    }
    
    private func addShadow() {
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.04
        cardView.layer.shadowRadius = 4
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    

}
