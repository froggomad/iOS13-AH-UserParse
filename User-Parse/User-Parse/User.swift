//
//  User.swift
//  User-Parse
//
//  Created by Kenny on 1/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct UserResults: Decodable {
    let results: [User]
}

struct User: Decodable {
    var name: Name
    var email: String
    var phone: String
    var picture: Picture
}

struct Name: Decodable {
    let first: String
    let last: String
}

struct Picture: Decodable {
    let thumbnail: URL
    let large: URL
}
