//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Sean Allen on 12/30/19.
//  Copyright © 2019 Sean Allen. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView! // global only to this file
fileprivate var activityIndicator: UIActivityIndicatorView! // global only to this file

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)

        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0

       UIView.animate(withDuration: 0.25, animations: {containerView.alpha = 0.8})

        activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        activityIndicator.startAnimating()
    }
    
    func hideLoadingView() {
        activityIndicator.stopAnimating()
        
        UIView.animate(withDuration: 0.25, animations: {containerView.alpha = 0})
        
        containerView.removeFromSuperview()
        activityIndicator.removeFromSuperview()
    }
}

