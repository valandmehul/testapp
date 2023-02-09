//
//  pokeDetailsModel.swift
//  testapp
//
//  Created by mehul on 01/02/2023.
//

import Foundation

struct pokeDetailsModel : Codable {
    var sprites : spritemodel?
    var hight : Int?
    var name : String?
}

struct spritemodel : Codable {
    var front_default : String?
}


