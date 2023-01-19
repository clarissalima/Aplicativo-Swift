//
//  MinhasTarefasViewController.swift
//  Tarefeitas
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MinhasTarefasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var qtdTarefasConcluidasLabel: UILabel!
    
    @IBOutlet weak var qtdTarefasLabel: UILabel!
    
    @IBOutlet weak var porcentagemMinhaTotalLabel: UILabel!
    
    var tarefas : [Tarefa]?
    var listaTodasTarefas : [[String]]?
    var qtdTarefasConcluidas = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        qtdTarefasConcluidas = contandoTarefasConcluidas()
        qtdTarefasConcluidasLabel.text = String(qtdTarefasConcluidas)
        qtdTarefasLabel.text = String(tarefas!.count)
        self.tableView.reloadData()
        porcentagemMinhaTotalLabel.text = String(format: "%.1f", (Float(tarefas!.count)/Float(listaTodasTarefas!.count))*Float(100))
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellminhatarefa"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MinhasTarefasTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InfoTableViewCell.")
        }
        let tarefa = tarefas![indexPath.row]
        
        //if(tarefa.concluida == "true"){
          //  cell.imagemConcluida.image =
        //} //cell.botaoConcluir(canPerformAction(<#T##action: Selector##Selector#>, withSender: <#T##Any?#>))
        //cell.imagemConcluida.image = UIImage.init(systemName: s)
        if(tarefa.concluida == "true"){
          cell.imagemConcluida.image = UIImage(systemName: "checkmark.square.fill")
            cell.botaoConcluir.isEnabled = false
        }
        
        cell.tarefaLabel.text = tarefa.tarefa
        
        return cell }

    func contandoTarefasConcluidas() -> Int {
        qtdTarefasConcluidas = 0
        for tarefa in tarefas!{
            if (tarefa.concluida == "true") {
                qtdTarefasConcluidas += 1
            }
        }
        return qtdTarefasConcluidas
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
