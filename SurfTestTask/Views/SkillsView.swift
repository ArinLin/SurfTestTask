//
//  SkillsView.swift
//  SurfTestTask
//
//  Created by Arina on 01.08.2023.
//

import UIKit

enum ButtonState {
    case pencil
    case circle
}

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
    
    public weak var presentationDelegate: UIViewController?
    
    private var skills: [String] = ["Swift", "iOS Development", "UI/UX Design"]
    private var isEditingEnabled = false
    private var buttonState: ButtonState = .pencil
    
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
        buttonState = isEditingEnabled ? .circle : .pencil
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
            let alert = UIAlertController(title: "Добавить навык", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Введите название"
            }
            let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
                guard let textField = alert.textFields?.first,
                        let skill = textField.text, !skill.isEmpty else { return }
                self?.skills.append(skill)
                self?.collectionView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            presentationDelegate!.present(alert, animated: true, completion: nil)
        }
}

// MARK: - Collection Extensions

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
        cell.deleteButton.isHidden = buttonState != .circle
        cell.delegate = self
        cell.backgroundColor = Resourses.Colors.background
        cell.layer.cornerRadius = 12
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SkillHeader.reuseID, for: indexPath) as? SkillHeader else {
            fatalError("Unable to dequeue HeaderView")
        }
        
        headerView.delegate = self
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let skill = skills[indexPath.item]
        let size = skill.size(withAttributes: [.font: Resourses.Fonts.helveticaRegular(with: 14)])
        let deleteButtonWidth: CGFloat = buttonState == .circle ? 20 : 0
        return CGSize(width: size.width + 24 + deleteButtonWidth, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

// MARK: - View Extensions

extension SkillsView: SkillCellDelegate {
    func deleteSkill(at index: Int) {
        skills.remove(at: index)
        collectionView.reloadData()
    }
}

extension SkillsView: SkillHeaderDelegate {
    func toggleEditingState() {
        toggleEditing()
    }
    func editButtonTapped() {
        if buttonState == .circle {
            addSkill()
        }
    }
}

protocol SkillCellDelegate: AnyObject {
    func deleteSkill(at index: Int)
}
