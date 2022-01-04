//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Sean Allen on 1/4/20.
//  Copyright © 2020 Sean Allen. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    let cache = NetworkManager.shared.cache
    private var debugCount = 0

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
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // we don't need to handle an error at all, we return and by the place holder image is set
    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            //print("\(debugCount) cache\r")
            self.image = image
            debugCount = debugCount + 1
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            if error != nil { return } //ie the placeholder be our error message
            
            guard let response = response as? HTTPURLResponse,
                  let data = data,
                  let self = self,
                  response.statusCode == 200 else { return }

            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            self.debugCount = self.debugCount + 1
            //print("\(self.debugCount) network call\r")
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
