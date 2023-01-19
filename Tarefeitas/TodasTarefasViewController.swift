//
//  TodasTarefasViewController.swift
//  Tarefeitas
//
//  Created by Student on 08/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class TodasTarefasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var qtdTotalTarefasLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var membros : [CellPessoa]?
    var nomeGrupo : String?
    var nomeCadastro : String?
    var listaTodasTarefas : [[String]]?
    
    var contador = 0
    var porcentagem = 0
    var qtdTarefasConcluidas: Int = 0
    //var listaTodasTarefas = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //qtdTarefasConcluidas = contandoTarefasConcluidas()
        //contador = contadorTarefas()
        //listaTodasTarefas = fazendoListaTarefas()
        contador = listaTodasTarefas!.count
        qtdTotalTarefasLabel.text = String(contador)
        //printarLista()
        
        self.tableView.reloadData()
        //qtdTotalTarefasLabel.text = String(listaTodasTarefas.count)
        // Do any additional setup after loading the view.
    }
    
    
  /*
    func contandoTarefasConcluidas() -> Int {
          for membro in membros! {
              for tarefa in membro.listaTarefas{
                  //listaTodasTarefas += [tarefa.tarefa!, membro.nomePessoa!]
                  if (tarefa.concluida == "true") {
                      qtdTarefasConcluidas += 1
                  }
              }
          }
        return qtdTarefasConcluidas
    }
    func contadorTarefas() -> Int {
        contador = 0
        for membro in membros! {
            for tarefa in membro.listaTarefas{
                contador += 1
            }
        }
        return contador
    }
    
  /*  func fazendoListaTarefas() -> [[String]] {
        var contador1 = 0
          for membro in membros! {
              for tarefa in membro.listaTarefas{
                listaTodasTarefas[contador1][0] = membro.nomePessoa!
                listaTodasTarefas[contador1][1] = tarefa.tarefa!
                contador1 += 1

              }
          }
        return listaTodasTarefas
    } */
    
    func fazendoListaTarefas() -> [[String]] {
        var contador1 = 0
        var listinhaPequena = [String]()
          for membro in membros! {
              for tarefa in membro.listaTarefas{
                listinhaPequena.append(tarefa.tarefa!)
                listinhaPequena.append(tarefa.concluida)
                listinhaPequena.append(membro.nomePessoa!)
                listaTodasTarefas.append(listinhaPequena)
                listinhaPequena = []
                contador1 += 1

              }
          }
        return listaTodasTarefas
    }
    
    func printarLista(){
        //var i = 0
        //for i in 0...1 {
            print(listaTodasTarefas)
        print(listaTodasTarefas.count)
        //}
    } */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTodasTarefas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "celltarefa"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TodasTarefasTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InfoTableViewCell.")
    }
        

        //cell.tarefaLabel.text =
    
        
        let tarefa = listaTodasTarefas![indexPath.row]
        
        cell.tarefaLabel.text = tarefa[0]
        if(self.nomeCadastro == tarefa[2]) {
            cell.nomePessoaLabel.text = tarefa[2] + " (Eu)"
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.nomePessoaLabel.text = tarefa[2] }
        return cell }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
