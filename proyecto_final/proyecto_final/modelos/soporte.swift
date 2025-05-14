//
//  soporte.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

struct PaginaResultadosCriatura: Codable{
        let data: [Criatura]
}

struct PaginaResultadosMonstruos: Codable{
        let data: [Monstruo]
}

struct DatosCriatura: Codable{
    let data : Criatura
}

struct DatosMonstruo: Codable{
    let data : Monstruo
}
