//
//  GruposTableViewCell.swift
//  Tarefeitas
//
//  Created by Student on 31/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class GruposTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeGrupoLabel: UILabel!
    
    @IBOutlet weak var imageGrupo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
