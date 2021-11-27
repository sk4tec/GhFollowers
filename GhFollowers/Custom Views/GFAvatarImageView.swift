//
//  GFAvatarImageView.swift
//  GhFollowers
//
//  Created by Sunjay Kalsi on 27/11/2021.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
