//
//  apiService.swift
//  testapp
//
//  Created by mehul on 31/01/2023.
//

import Foundation

class service : NSObject {
    
    static let shared = service()
    
    /*func fetchingData<T>(_ urlstring : String, _ completion : @escaping(_ pokedata : T,Error) -> ()) {
        guard let url = URL(string: urlstring) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            //chack response
            guard let data = data else { return }
            //chack error
            if let err = error {
                completion(nil, err)
                print("\(err)")
                return
            }
            //json decoding
            do {
                let list = try JSONDecoder().decode(pokeModel.self, from: data)
                DispatchQueue.main.async {
                    completion(pokedata,nil)
                }
            } catch let jsonerr {
                print("failed to decode \(jsonerr)")
            }
            
        }.resume()
    }*/
    
    func fetchData(urlstring : String, completion : @escaping (pokeModel?, Error?) -> ()) {
        guard let url = URL(string: urlstring) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            //chack response
            guard let data = data else { return }
            //chack error
            if let err = error {
                completion(nil, err)
                print("\(err)")
                return
            }
            //json decoding
            do {
                let list = try JSONDecoder().decode(pokeModel.self, from: data)
                DispatchQueue.main.async {
                    completion(list,nil)
                }
            } catch let jsonerr {
                print("failed to decode \(jsonerr)")
            }
            
        }.resume()
    }
    
    func fetchDetailsData(urlstring : String, completion : @escaping (pokeDetailsModel?, Error?) -> ()) {
        guard let url = URL(string: urlstring) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            //chack response
            guard let data = data else { return }
            //chack error
            if let err = error {
                completion(nil, err)
                print("\(err)")
                return
            }
            //json decoding
            do {
                let list = try JSONDecoder().decode(pokeDetailsModel.self, from: data)
                DispatchQueue.main.async {
                    completion(list,nil)
                }
            } catch let jsonerr {
                print("failed to decode \(jsonerr)")
            }
            
        }.resume()
    }
}
