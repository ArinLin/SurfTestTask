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
    
    private let aboutView = AboutView()
    
    
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
        scrollView.addSubview(aboutView)
    }

    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        userInfo.translatesAutoresizingMaskIntoConstraints = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            userInfo.topAnchor.constraint(equalTo: scrollView.topAnchor),
            userInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfo.heightAnchor.constraint(equalToConstant: 244),
            
            collection.topAnchor.constraint(equalTo: userInfo.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 300),
            
            aboutView.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 24),
            aboutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aboutView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100),
        ])
    }

}

