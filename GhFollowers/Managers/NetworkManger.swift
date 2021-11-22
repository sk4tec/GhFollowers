//
//  NetworkManger.swift
//  GhFollowers
//
//  Created by Sunjay Kalsi on 08/11/2021.
//

import Foundation

class NetWorkManager {
    let shared = NetWorkManager()
    let baseUrl = "https://api.github.com/user/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Please try again")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data recieved from the server was invalid. Please try again.")
                return
            }
        }
        
        task.resume()
    }
}
