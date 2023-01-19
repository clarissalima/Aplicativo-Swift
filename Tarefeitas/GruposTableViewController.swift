//
//  GruposTableViewController.swift
//  Tarefeitas
//
//  Created by Student on 31/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class GruposTableViewController: UITableViewController {
    
    var grupos = [GruposPag]()
    var nomeCadastro = "Emanuel"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return grupos.count
    }

    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "grupo"
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MoedasTableViewCell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GruposTableViewCell  else {
            fatalError("The dequeued cell is not an instance of InfoTableViewCell.")
        }

        // Fetches the appropriate meal for the data source layout.
        let grupo = grupos[indexPath.row]
        //switch
        let str = (grupo.nomeGrupo!.lowercased()).prefix(1)
        cell.imageGrupo.image = UIImage(systemName: "\(str).square.fill")
        cell.imageGrupo.tintColor = UIColor.systemYellow
        /*switch (str.prefix(1)) {
            case "A":
            cell.imageGrupo.image = UIImage(systemName: "a.square.fill")
            case "B":
            cell.imageGrupo.image = UIImage(systemName: "B.square.fill")
            case "C":
            cell.imageGrupo.image = UIImage(systemName: "c.square.fill")
            case "D":
            cell.imageGrupo.image = UIImage(systemName: "d.square.fill")
            case "E":
            cell.imageGrupo.image = UIImage(systemName: "e.square.fill")
            case "F":
            cell.imageGrupo.image = UIImage(systemName: "f.square.fill")
            case "G":
            cell.imageGrupo.image = UIImage(systemName: "g.square.fill")
            case "H":
            cell.imageGrupo.image = UIImage(systemName: "h.square.fill")
            case "I":
            cell.imageGrupo.image = UIImage(systemName: "i.square.fill")
            case "J":
            cell.imageGrupo.image = UIImage(systemName: "j.square.fill")
            case "K":
            cell.imageGrupo.image = UIImage(systemName: "k.square.fill")
            case "L":
            cell.imageGrupo.image = UIImage(systemName: "l.square.fill")
            case "M":
            cell.imageGrupo.image = UIImage(systemName: "m.square.fill")
            case "N":
            cell.imageGrupo.image = UIImage(systemName: "n.square.fill")
            case "O":
            cell.imageGrupo.image = UIImage(systemName: "o.square.fill")
            case "P":
            cell.imageGrupo.image = UIImage(systemName: "p.square.fill")
            case "Q":
            cell.imageGrupo.image = UIImage(systemName: "q.square.fill")
            case "R":
            cell.imageGrupo.image = UIImage(systemName: "r.square.fill")
            case "S":
            cell.imageGrupo.image = UIImage(systemName: "s.square.fill")
            case "T":
            cell.imageGrupo.image = UIImage(systemName: "t.square.fill")
            case "U":
            cell.imageGrupo.image = UIImage(systemName: "u.square.fill")
            case "V":
            cell.imageGrupo.image = UIImage(systemName: "v.square.fill")
            case "W":
            cell.imageGrupo.image = UIImage(systemName: "w.square.fill")
            case "X":
            cell.imageGrupo.image = UIImage(systemName: "x.square.fill")
            case "Y":
            cell.imageGrupo.image = UIImage(systemName: "y.square.fill")
            case "Z":
            cell.imageGrupo.image = UIImage(systemName: "z.square.fill")
        default:
            cell.imageGrupo.image = UIImage(systemName: "checkmark.square.fill")
        }*/
        cell.nomeGrupoLabel.text = grupo.nomeGrupo
        

        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueDetalhe"{
            
            if let novaView = segue.destination as? DetalhesViewController{
                
                let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                let moedaDaCelula = moedas[celulaSelecionada!]
                novaView.moedaSelecionada = moedaDaCelula
                
                
                
            }
            
        }
    }*/

    //MARK: Private Methods
    private func loadProducts() { //This function retrieves information in a JSON format from the server
       /*let url = URL(string: "https://api.coincap.io/v2/assets")!

           URLSession.shared.dataTask(with: url, completionHandler: {[unowned self] data, response, error in
               if let error = error { print(error); return }
               do {
                   self.moedas = try JSONDecoder().decode([Moeda].self, from: data!)
                   print(self.moedas)
                  
                for moeda in self.moedas {
                    print(moeda)
                    let cod_ext: String = moeda[1]   // Codul de bare al produsului
                    let nume_prod: String = moeda[3] // Numele produsului
                    
                    let prod_obj = Moeda(rank: cod_ext, name: nume_prod)
                    self.moedas.append(prod_obj)
                }
               } catch {
                   print("JSON Serialization error")
               }
           }).resume()
       }*/
            
        
        
       var request = URLRequest(url: URL(string: "http://127.0.0.1:1880/ler")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                
                print(response!)
               print(data!)
                
                let decoder = JSONDecoder()
                let json = try decoder.decode([GruposPag].self, from: data!)
                print(json)
                
                self.grupos = json

                DispatchQueue.main.async {
                      self.tableView.reloadData()
                    print("success")
                }
                
                print(self.grupos.count)
                /*for moeda in json {
                    print(moeda)
                    let cod_ext: String = moeda[1]   // Codul de bare al produsului
                    let nume_prod: String = moeda[3] // Numele produsului
                    
                    let prod_obj = Moeda(rank: cod_ext, name: nume_prod)
                    self.moedas.append(prod_obj)
                }*/
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gruposelecionado"{
            if let viewDetalhes = segue.destination as? DetalhesGrupoViewController {
                let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                let grupoDaCelula = grupos[celulaSelecionada!].grupo
                let nomeDoGrupoDaCelula = grupos[celulaSelecionada!].nomeGrupo
                //let descricaoDoGrupoDaCelula = grupos[celulaSelecionada!].descricao
                viewDetalhes.descricaoGrupo = grupos[celulaSelecionada!].descricaoGrupo
                viewDetalhes.nomeGrupo = nomeDoGrupoDaCelula
                viewDetalhes.membros = grupoDaCelula
                viewDetalhes.nomeCadastro = self.nomeCadastro
                //viewDetalhes.descricao = descricaoDoGrupoDaCelula
                
            }
        }
    }
    

}

