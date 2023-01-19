//
//  SobreGrupoViewController.swift
//  Tarefeitas
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class SobreGrupoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    var membros : [CellPessoa]?
    var nomeGrupo : String?
    var descricaoGrupo : String?
    var nomeCadastro : String?
    //var descricaoGrupo : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = nomeGrupo?.uppercased()
        descricaoLabel.text = descricaoGrupo
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return membros!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellmembro"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SobreGrupoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InfoTableViewCell.")
        }
        let membro = membros![indexPath.row]

        cell.nomePessoaLabel.text = membro.nomePessoa
        
        return cell
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
