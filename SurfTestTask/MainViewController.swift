//
//  MainViewController.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let photo: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        photo.layer.cornerRadius = 25
        photo.image = UIImage(systemName: "questionmark")
        return photo
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = Resourses.Colors.textColor
        label.font = Resourses.Fonts.helveticaRegular(with: 24)
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = Resourses.Texts.name
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = Resourses.Colors.textDescription
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
//        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = Resourses.Texts.description
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
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setConstraints()
        
        view.backgroundColor = Resourses.Colors.background
        navigationItem.title = Resourses.Texts.profile
    }
    
    private func setView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(photo)
        contentView.addSubview(vStack)
    }

    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        photo.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo:view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.heightAnchor.constraint(equalToConstant: 64),
            
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            vStack.leadingAnchor.constraint (equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}

