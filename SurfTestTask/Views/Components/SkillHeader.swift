//
//  SkillHeader.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

protocol SkillHeaderDelegate: AnyObject {
    func editButtonTapped()
    func toggleEditingState()
}

final class SkillHeader: UICollectionReusableView {
    
    // MARK: - Variables
    
    static let reuseID = "SkillHeader"
    
    weak var delegate: SkillHeaderDelegate?
    
    var buttonState: ButtonState = .pencil {
            didSet {
                setButtonImageForState()
            }
        }
    
    let label: UILabel = {
        let label = UILabel()
        label.text = Resourses.Texts.skills
        return label
    }()

    lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Resourses.Images.pencil, for: .normal)
        button.tintColor = Resourses.Colors.textColor
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    // hugging priority
    private lazy var hStack: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [label, editButton])
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        return hStack
    }()

    // MARK: - Init
    
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
    
    // MARK: - ButtonSettings
    
    @objc func editButtonTapped() {
        delegate?.toggleEditingState()
        delegate?.editButtonTapped()
        switch buttonState {
        case .pencil:
            buttonState = .circle
        case .circle:
            buttonState = .pencil
        }
        setButtonImageForState()
    }
    
    private func setButtonImageForState() {
        switch buttonState {
        case .pencil:
            editButton.setImage(Resourses.Images.pencil, for: .normal)
        case .circle:
            editButton.setImage(Resourses.Images.checkmark, for: .normal)
        }
    }
    
    // MARK: - ViewSettings

    func setupViews() {
        addSubview(hStack)
    }

    func constraintViews() {
        hStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            hStack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
