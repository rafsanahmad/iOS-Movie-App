//
//  TMDBApiResponses.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import Foundation

struct PeopleResponse: Decodable {
    let results: [Person]
}

struct ShowsResponse: Decodable {
    let results: [Show]
}

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct LoginResponse: Decodable {
    let success: Bool
}

struct AuthTokenResponse: Decodable {
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
