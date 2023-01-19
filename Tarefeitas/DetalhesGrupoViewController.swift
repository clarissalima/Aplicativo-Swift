//
//  DetalhesGrupoViewController.swift
//  Tarefeitas
//
//  Created by Student on 04/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class DetalhesGrupoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nomeGrupo : String?
    var descricaoGrupo : String?
    var membros : [CellPessoa]?
    var nomeCadastro : String?
    
    //@IBOutlet weak var imageTela2: UIImageView!
    
    
   // @IBOutlet  var navigationItem: UINavigationItem?
    
    @IBOutlet weak var barraProgressView: UIProgressView!
    
    @IBOutlet weak var porcentagemLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var contador = 0
    var porcentagemConcluida = 0
    var qtdTarefasConcluidas: Int = 0
    var listaTodasTarefas = [[String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //barraProgressView.frame(width: 200, height: 20)
        //arraProgressView.trackTintColor = UIColor.lightGray
        navigationItem.title = nomeGrupo?.uppercased()
        //navigationItem.title.color = UIColor.purple
        barraProgressView.progressTintColor = UIColor.yellow
        
        barraProgressView.backgroundColor = UIColor.white
        //barraProgressView.transform = CGAffineTransformMakeScale(1.0f, 3.0f)
        porcentagemConcluida = 0
        qtdTarefasConcluidas = 0
        listaTodasTarefas = []
        //valores das coisas:
        qtdTarefasConcluidas = contandoTarefasConcluidas()
        listaTodasTarefas = fazendoListaTarefas()
        let porcentagemConcluida = (Float(qtdTarefasConcluidas)/Float(listaTodasTarefas.count))
        barraProgressView.progress = Float(porcentagemConcluida)
        porcentagemLabel.text = String(format: "%.1f", porcentagemConcluida*100)
        self.tableView.reloadData()
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

   
    
     func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
            
            print(membros?.count ?? 0)
            return membros?.count ?? 0
       }

       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cellIdentifier = "cellpessoa"
          guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetalhesGrupoTableViewCell  else {
              fatalError("The dequeued cell is not an instance of InfoTableViewCell.")
            
        
          }


    //atribuir valor as coisas da celula:
            
        
            let membro = membros![indexPath.row]
            cell.nomePessoaLabel.text = membro.nomePessoa
            cell.qtdTarefasPessoa.text = String((membro.listaTarefas).count)
           // cell.ImageTela2.image =
            
            //cell.nomePessoaLabel.text = grupo.data.nomeGrupo
           // ImageTela2.image = UIImage (data: data)
           // ImageTela2.image = getRandomPhoto()
           // Configure the cell...

           return cell
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "minhastarefas"{
            if let viewDetalhes = segue.destination as? MinhasTarefasViewController {
         //////////N EH TABLE VIEW - É BOTÃO:
                for membro in membros! {
                    if(self.nomeCadastro == membro.nomePessoa) {
                    let tarefasDaPessoaCadastro = membro.listaTarefas
                        viewDetalhes.tarefas = tarefasDaPessoaCadastro
                        viewDetalhes.listaTodasTarefas = listaTodasTarefas
                }
            }
                
                
            }
        }
        if segue.identifier == "todastarefas"{
            if let viewDetalhes = segue.destination as? TodasTarefasViewController {
                //let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                //let grupoDaCelula = self.membros[celulaSelecionada!].tarefa
                viewDetalhes.membros = membros
                viewDetalhes.nomeCadastro = nomeCadastro
                //listaTodasTarefas = fazendoListaTarefas()
                viewDetalhes.listaTodasTarefas = listaTodasTarefas
                
            }
        }
        if segue.identifier == "sobregrupo"{
            if let viewDetalhes = segue.destination as? SobreGrupoViewController {
                //let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                //let grupoDaCelula = self.membros[celulaSelecionada!].tarefa
                viewDetalhes.membros = membros
                viewDetalhes.descricaoGrupo = descricaoGrupo
                viewDetalhes.nomeGrupo = nomeGrupo
                viewDetalhes.nomeCadastro = nomeCadastro
                //viewDetalhes.listaTodasTarefas = listaTodasTarefas
                
            }
        }
    }
    
    
    //////////////////////////////FUNCOES TELA QTD TOTAL DE TAREFAS:
    
       
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
       }
       
    
}
/*
    private func loadProducts() {
        var request = URLRequest(url: URL(string: "http://127.0.0.1:1880/ler2")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                print(response!)
                print(data!)
                
                let decoder = JSONDecoder()
                let json = try decoder.decode([GruposPag].self, from: data!)
                print(json)
                
                //self.membros = json.

                DispatchQueue.main.async {
                      self.tableView.reloadData()
                    print("success")
                }
                
                print(self.membros!.count)
        
    } catch {
            print("JSON Serialization error")
        }
    }).resume()
    }

*/
    
    
    /*func getRandomPhoto() -> UIImage{
                 let urlString = "http://source.unsplash.com/random/600x600"
             //era pra ter "url" no lugar do _
                 let url = URL(string: urlString)!
                 guard let data = try? Data(contentsOf: url)
                     else{
                        return UIImage()
                 }
        return UIImage(data: data) ??
                 
             }*/

       /*
       // Override to support conditional editing of the table view.
       override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           // Return false if you do not want the specified item to be editable.
           return true
       }
       */

       /*
       // Override to support editing the table view.
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               // Delete the row from the data source
               tableView.deleteRows(at: [indexPath], with: .fade)
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
           }
       }
       */

       /*
       // Override to support rearranging the table view.
       override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

       }
       */

       /*
       // Override to support conditional rearranging of the table view.
       override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
           // Return false if you do not want the item to be re-orderable.
           return true
       }
       */

       /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */


