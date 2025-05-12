//
//  controlador_app.swift
//  proyecto_final
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

@Observable
@MainActor

public class ControladorAplicacion{
    var criaturas: Array<Criatura> = []
    
    var pagina_resultados : PaginaResultados? = nil
    
    var criatura_animal: Criatura? = nil
    
    init(){
            Task.detached(priority: .high){
                await self.descargar_criaturas()

        }
    }
    
    // PARA DESCARGAR TODAS LAS CRIATURAS
    func descargar_criaturas() async {
        guard let pagina_descargada: PaginaResultados = try? await BOTW_Api().descargar_pagina_criaturas() else {return}
        self.pagina_resultados = pagina_descargada
        
        criaturas = pagina_descargada.items
        
        await print(BOTW_Api().descargar_pagina_criaturas())
    }
    
    //PARA DESCARGAR CRIATURA INDIVIDUAL
    func descargar_animal_individual(id: Int) async{
        guard let animal: Criatura = try? await BOTW_Api().descargar_criatura_individual(id: id) else {return}
        self.criatura_animal = animal;
    }
    
    func descargar_animal_api(id: Int) {
        Task.detached(operation: {
            await self.descargar_animal_individual(id: id)
        })
    }
    
}
