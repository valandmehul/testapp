//
//  pokeTableViewCell.swift
//  testapp
//
//  Created by mehul on 31/01/2023.
//

import UIKit

class pokeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
