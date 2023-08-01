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
    
    private let userInfo = UserInfoView()
    
    private let collection = SkillsView()
    
//    private let collection: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 8
//        layout.minimumLineSpacing = 8
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .red
//        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
//        return collectionView
//    }()
    
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setConstraints()
        
        collection.presentationDelegate = self
        
        view.backgroundColor = Resourses.Colors.background
        navigationItem.title = Resourses.Texts.profile
    }
    
    private func setView() {
        view.addSubview(scrollView)
        scrollView.addSubview(userInfo)
        scrollView.addSubview(collection)
    }

    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        userInfo.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo:view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            userInfo.topAnchor.constraint(equalTo: scrollView.topAnchor),
            userInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfo.heightAnchor.constraint(equalToConstant: 244),
            
            collection.topAnchor.constraint(equalTo: userInfo.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 600)
        ])
    }

}

