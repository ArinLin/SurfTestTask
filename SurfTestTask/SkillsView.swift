//
//  SkillsView.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

class SkillsView: UIView {
    // MARK: - Variables
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
        collectionView.register(SkillHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SkillHeader.reuseID)
        
        return collectionView
    }()
    
    private var skills: [String] = ["Swift", "iOS Development", "UI/UX Design"]
    private var isEditingEnabled = false
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        setConstraints()
        backgroundColor = UIColor.white
    }
    
    func toggleEditing() {
        isEditingEnabled = !isEditingEnabled
        collectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func setView() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Button settings
    private func addSkill() {
            // Display a native alert to enter the skill name
            let alert = UIAlertController(title: "Добавить навык", message: nil, preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Введите название"
            }
            let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
                guard let textField = alert.textFields?.first, let skill = textField.text, !skill.isEmpty else {
                    return
                }
                self?.skills.append(skill)
                self?.collectionView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
}

// MARK: - Extensions

extension SkillsView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCell.reuseIdentifier, for: indexPath) as? SkillCell else {
            return UICollectionViewCell()
        }
        
        let skill = skills[indexPath.item]
        cell.configure(with: skill, isEditingEnabled: isEditingEnabled)
        cell.delegate = self
        cell.backgroundColor = Resourses.Colors.background
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SkillHeader.reuseID, for: indexPath) as? SkillHeader else {
            fatalError("Unable to dequeue HeaderView")
        }
        
        // Конфигурируем кнопки
        //                headerView.editButton.setTitle(Resourses.Texts.skills, for: .normal)
        headerView.editButton.addTarget(self, action: #selector(SkillHeader.editButtonTapped), for: .touchUpInside)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 24) 
    }
}

extension SkillsView: SkillCellDelegate {
    func deleteSkill(at index: Int) {
        skills.remove(at: index)
        collectionView.reloadData()
    }
}

protocol SkillCellDelegate: AnyObject {
    func deleteSkill(at index: Int)
}

extension SkillsView: SkillHeaderDelegate {
    func editButtonTapped() {
        // Call the addSkill function to show the alert
        addSkill()
    }
}
