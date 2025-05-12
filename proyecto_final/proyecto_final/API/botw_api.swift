//
//  botw_api.swift
//  proyecto_final
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

class BOTW_Api : Codable {
    var url_api = "https://botw-compendium.herokuapp.com/api/v3/compendium"
    
    //CRIATURA
    
    func descargar_pagina_criaturas() async -> PaginaResultados?{
        let ubicacion_criaturas = "/category/creatures"
        return await descargar(recurso: ubicacion_criaturas)
    }
    
    //CRIATURA (INDIVIDUAL)
    
    func descargar_criatura_individual(id: Int) async -> Criatura?{
        let ubicacion_criatura_individual = "/entry/\(id)"
        return await descargar(recurso: ubicacion_criatura_individual)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
            do {
               
                guard let url = URL(string: "\(url_api)\(recurso)") else {throw ErroresDeRed.badUrl}
                let (datos, respuesta) = try await URLSession.shared.data(from: url)
                guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
                guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
                
                do{
                    let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                    return respuesta_decodificada
                }
                catch let error as NSError{
                    print("El error en tu modelo es: \(error.debugDescription)")
                    print("")
                    throw ErroresDeRed.fallaAlConvertirLaRespuesta
                }
            }
            catch ErroresDeRed.badUrl {
                print("Direcccion URL incorrecta.")
                print("")
            }
            catch ErroresDeRed.badResponse {
                print("Algo salió con la respuesta, revisa por favor.")
                print("")
            }
            catch ErroresDeRed.badStatus {
                print("Bad Status")
                print("")
            }
            catch ErroresDeRed.fallaAlConvertirLaRespuesta{
                print("Implementación o modelo incorrecto")
                print("en tu Api de Legend of Zelda BOTW")
                print("")
                print("\(url_api)\(recurso)")
            }
            catch ErroresDeRed.invalidRequest {
                print("¿Cómo llegaste aquí?")
                print("")
            }
            
            catch {
                print ("Oops algo pasó")
            }
            
            return nil;
        }
}
