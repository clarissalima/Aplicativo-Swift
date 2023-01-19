//
//  Tela1.swift
//  Tarefeitas
//
//  Created by Student on 04/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

struct Grupos: Codable {
    var _id : String
    var _rev : String
    var data : Grupo
}

struct Grupo: Codable {
    var id : Int?
    var nomeGrupo : String?
}
