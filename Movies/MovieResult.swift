//
//  MovieResult.swift
//  Movies
//
//  Created by EmreYiğit on 6.11.2023.
//

import Foundation

struct MovieResult: Codable {
    let page: Int
    let results: [Movie]
}
