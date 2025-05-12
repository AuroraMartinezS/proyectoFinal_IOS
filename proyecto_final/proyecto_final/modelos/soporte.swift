//
//  soporte.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

struct PaginaResultados: Codable{
        let items: [Criatura]
    
        enum CodingKeys: String, CodingKey {
        case items = "data"
        
      }
}
