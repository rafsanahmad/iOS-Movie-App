//
//  Show.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import Foundation

struct Show: Decodable {
    let id: Int
    let name: String
    let posterUrl: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, posterUrl = "poster_path", releaseDate = "first_air_date"
    }
}
