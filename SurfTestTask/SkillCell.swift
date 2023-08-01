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
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("✕", for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    weak var delegate: SkillCellDelegate?
    private var cellIndex: Int = 0
    
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
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            skillLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalTo: deleteButton.widthAnchor)
        ])
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.deleteSkill(at: cellIndex)
    }
    
    func configure(with skill: String, isEditingEnabled: Bool) {
        skillLabel.text = skill
        self.isEditingEnabled = isEditingEnabled
        deleteButton.isHidden = !isEditingEnabled
    }
}

