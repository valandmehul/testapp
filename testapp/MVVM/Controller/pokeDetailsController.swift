//
//  pokeDetailsController.swift
//  testapp
//
//  Created by mehul on 01/02/2023.
//

import UIKit
import SDWebImage

class pokeDetailsController: UIViewController {
    var detailsUrl : String = ""
    var pokedetails : pokeDetailViewModel?
    
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.shared.fetchDetailsData(urlstring: detailsUrl) { (Details, error) in
            
            if let eror = error {
                print("no data eror \(eror)")
                return
            }
            
            self.pokedetails = Details.flatMap({ return pokeDetailViewModel(pokedetails: $0)})
            self.lblname.text = self.pokedetails?.name
            self.image.sd_setImage(with: URL(string: (self.pokedetails?.image)!))
            //map({ return pokeViewMoodel(pokelist: $0) })
        
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
