//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Sunjay Kalsi on 06/01/2022.
//  Copyright © 2022 Sean Allen. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {

    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logimageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }

    private func configure() {
        addSubview(messageLabel)
        addSubview(logimageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logimageView.image = UIImage(named: "empty-state-logo")
        logimageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.center, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalTo: 200),
            
            logimageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logimageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
            logimageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 140)
        ])
        
    }
}
