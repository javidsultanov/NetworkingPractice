//
//  Comments.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

nonisolated struct Comments: Codable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}
