//
//  PostsManager.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import Foundation
import Alamofire

class NetworkingManager {
    func getPostItems(completion: @escaping (([Posts]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode([Posts].self, from: data)
                    completion(posts, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
