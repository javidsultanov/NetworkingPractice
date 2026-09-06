//
//  PostsViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import Foundation

class PostsViewModel {
    var posts: [Posts] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPosts() {
        manager.getPostItems { data, error in
            if let data {
                self.posts = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
