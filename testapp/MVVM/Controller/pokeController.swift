//
//  pokeController.swift
//  testapp
//
//  Created by mehul on 31/01/2023.
//

import Foundation
import UIKit

class pokeController : UIViewController {
    
    @IBOutlet weak var pokeTablview: UITableView!
    var pokeVM : pokeViewMoodel?
    var filterdata : pokeViewMoodel?
    @IBOutlet weak var searchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    fileprivate func fetchData() {
        service.shared.fetchData(urlstring: "https://pokeapi.co/api/v2/pokemon") { [weak self](pokelist, error) in
            if let eror = error {
                print("no data eror \(eror)")
                return
            }
            self?.pokeVM = pokelist.flatMap({ return pokeViewMoodel(pokelist: $0)})  //map({ return pokeViewMoodel(pokelist: $0) })
            self?.filterdata = self?.pokeVM
            if let _ = self?.pokeVM {
                self?.pokeTablview.reloadData()
            }
        }
    }
    
}

extension pokeController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeTableViewCell", for: indexPath) as! pokeTableViewCell
        cell.lblname.text = filterdata?.results?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Controller = storyboard.instantiateViewController(withIdentifier: "pokeDetailsController") as! pokeDetailsController
        Controller.detailsUrl = (filterdata?.results?[indexPath.row].url)!
        self.navigationController?.pushViewController(Controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


extension pokeController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //let search = pokeVM?.results!.contai
        
        filterdata?.results = searchText.isEmpty ? pokeVM?.results : pokeVM?.results?.filter { (item) -> Bool in
            // If Item matches the searchText, return true to include it
            // here filter function get name string and match with the searchtext if searchtext is include in name then it return true and add an item to the array.
            // Range = use of range is you can get true or false for text matching with the caseinsensitive.
            return item.name?.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
                
        pokeTablview.reloadData()
    }
}
