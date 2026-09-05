//
//  Posts.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 05.09.26.
//

import Foundation

nonisolated struct Posts: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
