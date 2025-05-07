//
//  errores.swift
//  proyecto_final
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

enum ErroresDeRed: Error{
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
