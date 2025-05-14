//
//  monstruo.swift
//  proyecto_final
//
//  Created by alumno on 5/14/25.
//

struct Monstruo: Identifiable, Codable{
        let name: String
        let id: Int
        let category: String
        let description: String
        let image: String
        let common_locations: [String]?
        let drops: [String]?
}
