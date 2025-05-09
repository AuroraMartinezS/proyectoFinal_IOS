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
    
    init(){
            Task.detached(priority: .high){
                await self.descargar_criaturas()

        }
    }
    
    func descargar_criaturas() async {
        guard let pagina_descargada: PaginaResultados = try? await BOTW_Api().descargar_pagina_criaturas() else {return}
        self.pagina_resultados = pagina_descargada
        
        criaturas = pagina_descargada.items
        
        await print(BOTW_Api().descargar_pagina_criaturas())
        
    }
    
}
