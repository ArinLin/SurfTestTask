//
//  UserInfoView.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

class UserInfoView: UIView {
    
    // MARK: - Variables
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let photo: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        photo.image = Resourses.Images.man
        return photo
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Resourses.Colors.textColor
        label.font = Resourses.Fonts.helveticaBold(with: 24)
        label.text = Resourses.Texts.name
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = Resourses.Colors.textDescription
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
        label.text = Resourses.Texts.description
        label.numberOfLines = 2
        return label
    }()
    
    private let locationMark: UIImageView = {
        let image = UIImageView()
        image.image = Resourses.Images.location
        return image
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = Resourses.Colors.textDescription
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
        label.text = Resourses.Texts.location
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [locationMark, locationLabel])
        hStack.axis = .horizontal
        hStack.spacing = 2
        hStack.distribution = .fill
        hStack.alignment = .center
        return hStack
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, hStack])
        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.distribution = .fill
        vStack.alignment = .center
        return vStack
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setView()
            setConstraints()
            backgroundColor = Resourses.Colors.background
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setView()
            setConstraints()
            backgroundColor = Resourses.Colors.background
        }
    
    // MARK: - ViewSettings
    
    private func setView() {
        addSubview(contentView)
        contentView.addSubview(photo)
        contentView.addSubview(vStack)
    }

    private func setConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        photo.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.heightAnchor.constraint(equalToConstant: 120),
            
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}

