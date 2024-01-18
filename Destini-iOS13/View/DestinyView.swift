//
//  DestinyView.swift
//  Destini-iOS13
//
//  Created by Nikita Shirobokov on 19.01.24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

@objc protocol choiceButtonProtocol: AnyObject {
    func didPressChoise(sender: UIButton)
}

final class DestiniView: UIView {
    
    weak var delegateChoiseButton: choiceButtonProtocol?
    var storyBrain = StoryBrain()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Elements
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var backgroundView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
   lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.text = "A story will be here soon..."
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var choice1Button: UIButton = {
        let choice1 = UIButton()
        choice1.setTitle("Choice 1", for: .normal)
        choice1.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        choice1.setTitleColor(.white, for: .normal)
        choice1.titleLabel?.numberOfLines = 0
        choice1.titleLabel?.font = .systemFont(ofSize: 23)
        choice1.layer.cornerRadius = 10
        choice1.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
        choice1.translatesAutoresizingMaskIntoConstraints = false
        return choice1
    }()
    
    lazy var choice2Button: UIButton = {
        let choice2 = UIButton()
        choice2.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        choice2.setTitle("Choice 2", for: .normal)
        choice2.setTitleColor(.white, for: .normal)
        choice2.titleLabel?.numberOfLines = 0
        choice2.titleLabel?.font = .systemFont(ofSize: 23)
        choice2.layer.cornerRadius = 10
        choice2.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
        choice2.translatesAutoresizingMaskIntoConstraints = false
        return choice2
    }()
    
    //MARK: - Methods
    @objc func choiceMade(_ sender: UIButton) {
        delegateChoiseButton?.didPressChoise(sender: sender)
    }
    
    func addingToStack() {
        stackView.addArrangedSubview(storyLabel)
        stackView.addArrangedSubview(choice1Button)
        stackView.addArrangedSubview(choice2Button)
    }
    
    func setUI() {
        addSubview(backgroundView)
        addSubview(stackView)
        addingToStack()
    }
}

//MARK: - Constraints
extension DestiniView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
