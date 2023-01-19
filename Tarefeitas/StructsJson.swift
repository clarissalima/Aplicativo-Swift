//
//  Tela2DetalhesGrupo.swift
//  Tarefeitas
//
//  Created by Student on 04/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

struct Tarefa : Codable {
    var id : Int?
    var tarefa : String?
    var concluida : String
}

struct CellPessoa : Codable {
    var id : Int
    var img : String?
    var nomePessoa : String?
    var listaTarefas : [Tarefa]
}

struct GruposPag : Codable {
    var _id : String
    var _rev : String
    var id : Int
    var nomeGrupo : String?
    var descricaoGrupo : String?
    var grupo : [CellPessoa]
    //var descricaoGrupo : String?
}

/* struct Pessoa : Codable {
    var _id : String
    var _rev : String
    var id : Int
    var email : String
    var senha : String
    var nomeUnicoPessoa : String
    var nomePessoa : String?
    var grupos : [GruposPag]?
}
*/
