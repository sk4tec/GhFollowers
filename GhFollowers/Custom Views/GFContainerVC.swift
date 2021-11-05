//
//  GFContainerVC.swift
//  GhFollowers
//
//  Created by Sunjay Kalsi on 02/11/2021.
//

import UIKit

class GFContainerVC: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //required for storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    private func configure() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
