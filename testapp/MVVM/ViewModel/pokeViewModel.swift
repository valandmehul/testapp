//
//  pokeViewModel.swift
//  testapp
//
//  Created by mehul on 31/01/2023.
//

import Foundation

struct pokeViewMoodel {
    var next : String?
    var results : [pokelistModel]?
    
    init (pokelist : pokeModel) {
        self.next = pokelist.next
        self.results = pokelist.results
    }
}


