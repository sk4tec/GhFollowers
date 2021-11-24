//
//  GFButton.swift
//  GhFollowers
//
//  Created by Sunjay Kalsi on 15/10/2021.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //happens when init from StoryBoard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bacgroundColour: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = bacgroundColour
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
