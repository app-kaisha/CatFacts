//
//  CatBreeds.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
// https://catfact.ninja/breeds https://catfact.ninja/facts

import Foundation

struct CatBreeds: Codable, Identifiable {
    let id = UUID().uuidString

    var breed: String
    var country: String
    var origin: String
    var coat: String
    var pattern: String
    
    enum CodingKeys: CodingKey {
        case breed
        case country
        case origin
        case coat
        case pattern
    }
}
