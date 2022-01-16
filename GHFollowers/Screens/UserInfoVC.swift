//
//  UserInfoVc.swift
//  GHFollowers
//
//  Created by Sunjay Kalsi on 16/01/2022.
//  Copyright © 2022 Sean Allen. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        print(userName!)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
