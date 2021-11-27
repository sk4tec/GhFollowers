//
//  NetworkManger.swift
//  GhFollowers
//
//  Created by Sunjay Kalsi on 08/11/2021.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(Result.failure(GFError.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(Result.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(Result.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(Result.failure(.invalidData))
                return
            }
            
            do {
                let decorder = JSONDecoder()
                decorder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decorder.decode([Follower].self, from: data)
                completed(Result.success(followers))
            } catch {
                completed(Result.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
