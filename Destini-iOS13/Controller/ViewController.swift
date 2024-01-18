//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Nikita Shirobokov on 19.01.24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    let destiniView = DestiniView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        destiniView.delegateChoiseButton = self
        setLayout()
        setupConstraints()
        updateUI()
    }
    
    //MARK: - Methods for navigation through the story
    
    func updateUI() {
        destiniView.storyLabel.text = storyBrain.getStoryTitle()
        destiniView.choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        destiniView.choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
    //MARK: - Methods for setting UI
    
    private func setLayout() {
        destiniView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(destiniView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            destiniView.topAnchor.constraint(equalTo: view.topAnchor),
            destiniView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            destiniView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destiniView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: choiceButtonProtocol {
    func didPressChoise(sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
}
