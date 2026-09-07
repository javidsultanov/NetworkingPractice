//
//  Photo.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 07.09.26.
//

import Foundation

nonisolated struct Photo: Codable {
    var id: String?
    var author: String?
    var width: Int?
    var height: Int?
    var url: String?
    var download_url: String?
}
