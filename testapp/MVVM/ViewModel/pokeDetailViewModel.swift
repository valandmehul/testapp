//
//  pokeDetailViewModel.swift
//  testapp
//
//  Created by mehul on 01/02/2023.
//

import Foundation

struct pokeDetailViewModel {
    
    var name : String?
    var image : String?
    
    init (pokedetails : pokeDetailsModel) {
        self.name = pokedetails.name
        self.image = pokedetails.sprites?.front_default
    }
    
}
