//
//  SkillCell.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

class SkillCell: UICollectionViewCell {
    static let reuseIdentifier = "SkillCell"
    private var isEditingEnabled = false
    
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.textColor = Resourses.Colors.textColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = Resourses.Fonts.helveticaRegular(with: 14)
        return label
    }()
    
    public let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Resourses.Images.cross, for: .normal)
        button.tintColor = Resourses.Colors.textColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    weak var delegate: SkillCellDelegate?
    private var cellIndex: Int = 0
    private var deleteButtonWidthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        setConstraints()
    }
    
    private func setView() {
        contentView.addSubview(skillLabel)
        contentView.addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        deleteButtonWidthConstraint = deleteButton.widthAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            deleteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deleteButton.heightAnchor.constraint(equalTo: deleteButton.widthAnchor),
            deleteButtonWidthConstraint!
        ])
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.deleteSkill(at: cellIndex)
    }
    
    func configure(with skill: String, isEditingEnabled: Bool) {
        skillLabel.text = skill
        self.isEditingEnabled = isEditingEnabled
        deleteButton.isHidden = !isEditingEnabled
        deleteButtonWidthConstraint?.constant = isEditingEnabled ? 20 : 0
    }
}

