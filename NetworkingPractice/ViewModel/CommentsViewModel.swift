//
//  CommentsViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

class CommentsViewModel {
    var comments: [Comments] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let postId: Int
    
    init(postId: Int) {
        self.postId = postId
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
