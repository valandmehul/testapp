//
//  pokeModel.swift
//  testapp
//
//  Created by mehul on 31/01/2023.
//

import Foundation

struct pokeModel : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [pokelistModel]?
}

struct pokelistModel : Codable {
    var name : String?
    var url : String?
}
