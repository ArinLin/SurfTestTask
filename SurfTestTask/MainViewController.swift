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
        scrollView.addSubview(userInfo)
    }

    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        userInfo.translatesAutoresizingMaskIntoConstraints = false
        
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
        ])
    }

}

