//
//  Users.swift
//  NetworkingPractice
//
//  Created by Javid Sultanov on 06.09.26.
//

import Foundation

nonisolated struct User: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Adress?
    var phone: String?
    var website: String?
    var company: Company?
}

nonisolated struct Company: Codable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
}

nonisolated struct Adress: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
}

nonisolated struct Geo: Codable {
    var lat: String?
    var lng: String?
}
