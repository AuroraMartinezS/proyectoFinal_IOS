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
    var monstruos: Array<Monstruo> = []
    
    var pagina_resultados : PaginaResultadosCriatura? = nil
    var pagina_resultados_monstruos : PaginaResultadosMonstruos? = nil
    
    //var criatura_animal: Criatura? = nil
    var criatura_animal: DatosCriatura? = nil
    
    init(){
            Task.detached(priority: .high){
                await self.descargar_criaturas()
                
                await self.descargar_monstruos()

        }
    }
    
    // PARA DESCARGAR TODAS LAS CRIATURAS
    func descargar_criaturas() async {
        guard let pagina_descargada: PaginaResultadosCriatura = try? await BOTW_Api().descargar_pagina_criaturas() else {return}
        self.pagina_resultados = pagina_descargada
        
        criaturas = pagina_descargada.data
        
        //await print(BOTW_Api().descargar_pagina_criaturas())
    }
    
    //PARA DESCARGAR CRIATURA INDIVIDUAL
    /*func descargar_animal_individual(id: Int) async{
        guard let animal: Criatura = try? await BOTW_Api().descargar_criatura_individual(id: id) else {return}
        self.criatura_animal = animal;
    }*/
    
    //PRUEBA PARA DESCARGAR CRIATURA INDIVIDUAL
    
    func descargar_animal_individual(id: Int) async{
        guard let animal: DatosCriatura = try? await BOTW_Api().descargar_criatura_individual(id: id) else {return}
        self.criatura_animal = animal
    }
    
    func descargar_animal_api(id: Int) {
        Task.detached(operation: {
            await self.descargar_animal_individual(id: id)
        })
    }
    
    //PARA DESCARGAR TODOS LOS MONSTRUOS
    func descargar_monstruos() async {
        guard let pagina_descargada_monstruos: PaginaResultadosMonstruos = try? await BOTW_Api().descargar_pagina_monstruo() else {return}
        self.pagina_resultados_monstruos = pagina_descargada_monstruos
        
        monstruos = pagina_descargada_monstruos.data
    }
    
}
