//
//  CommentsViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

class CommentsViewModel {
    var comments: [Comment] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let postId: Int
    let postTitle: String
    
    init(postId: Int, postTitle: String) {
        self.postId = postId
        self.postTitle = postTitle
    }
    
    func getComments() {
        manager.getCommentItems(postId: postId) { data, error in
            if let data {
                self.comments = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
