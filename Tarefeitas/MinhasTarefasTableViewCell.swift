//
//  MinhasTarefasTableViewCell.swift
//  Tarefeitas
//
//  Created by Gisele on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MinhasTarefasTableViewCell: UITableViewCell {

    @IBOutlet weak var imagemConcluida: UIImageView!
    
    @IBOutlet weak var botaoConcluir: UIButton!
    
    @IBOutlet weak var tarefaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
