//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Sunjay Kalsi on 26/01/2022.
//  Copyright © 2022 Sean Allen. All rights reserved.
//

import UIKit

enum ItemInfoType{
    case repo, gists, followers, following
}

class GFItemInfoView: UIView {

    let symbolImageImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImageImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageImageView.contentMode = .scaleAspectFill
        symbolImageImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repo:
            symbolImageImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            symbolImageImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
}
