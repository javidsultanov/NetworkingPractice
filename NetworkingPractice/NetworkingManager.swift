//
//  PostsManager.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import Foundation
import Alamofire

class NetworkingManager {
    func getPostItems(completion: @escaping (([Post]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getCommentItems(postId: Int, completion: @escaping (([Comment]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        
        AF.request(url, parameters: ["postId": postId]).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    completion(comments, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getAlbumItems(completion: @escaping (([Album]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let albums = try JSONDecoder().decode([Album].self, from: data)
                    completion(albums, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getUserItems(completion: @escaping (([User]?, String?) -> Void)) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(users, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func getPhotoItems(completion: @escaping (([Photo]?, String?) -> Void)) {
        let url = URL(string: "https://picsum.photos/v2/list")!
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    completion(photos, nil)
                } catch {
                    completion(nil, error.localizedDescription)
                }
                
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
