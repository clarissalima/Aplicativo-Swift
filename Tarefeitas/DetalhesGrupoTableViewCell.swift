//
//  DetalhesGrupoTableViewCell.swift
//  Tarefeitas
//
//  Created by Student on 07/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class DetalhesGrupoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ImageTela2: UIImageView!
    
    @IBOutlet weak var nomePessoaLabel: UILabel!
    
    @IBOutlet weak var qtdTarefasPessoa: UILabel! // poderiamos fazer tarefas.count
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
