//
//  PetsTableViewCell.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/23/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import UIKit

class PetsTableViewCell: UITableViewCell {

    @IBOutlet var img:UIImageView!
    @IBOutlet var nombre:UILabel!
    @IBOutlet var raza:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
