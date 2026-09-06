//
//  UsersViewModel.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

class UsersViewModel {
    var users: [User] = []
    
    private let manager = NetworkingManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getUsers() {
        manager.getUserItems { data, error in
            if let data {
                self.users = data
                self.success?()
            } else if let error {
                self.error?(error)
            }
        }
    }
}
