//
//  SkillHeader.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

protocol SkillHeaderDelegate: AnyObject {
    func editButtonTapped()
}

final class SkillHeader: UICollectionReusableView {
    static let reuseID = "SkillHeader"
    
    weak var delegate: SkillHeaderDelegate?
    
    let label: UILabel = {
        let label = UILabel()
        label.text = Resourses.Texts.skills
        return label
    }()

    let editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Resourses.Images.pencil, for: .normal)
        button.tintColor = Resourses.Colors.textColor
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [label, editButton])
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.distribution = .fillEqually
        hStack.alignment = .center
        return hStack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraintViews()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
    }
}

private extension SkillHeader {
    func setupViews() {
        addSubview(hStack)
//        addSubview(editButton)
    }

    func constraintViews() {
        hStack.translatesAutoresizingMaskIntoConstraints = false
//        editButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            hStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
extension SkillHeader {
    @objc func editButtonTapped() {
            delegate?.editButtonTapped()
        }
}
