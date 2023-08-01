//
//  AboutView.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

class AboutView: UIView {
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Resourses.Colors.textColor
        label.font = Resourses.Fonts.helveticaRegular(with: 16)
        label.text = Resourses.Texts.about
        return label
    }()
    
    private let aboutTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Resourses.Colors.textColor
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
        label.text = Resourses.Texts.aboutText
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView(arrangedSubviews: [aboutLabel, aboutTextLabel])
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.distribution = .equalSpacing
        vStack.alignment = .leading
        return vStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        setConstraints()
        backgroundColor = .white
    }
    
    private func setView() {
        addSubview(vStack)
        vStack.backgroundColor = .white
    }
    
    private func setConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
