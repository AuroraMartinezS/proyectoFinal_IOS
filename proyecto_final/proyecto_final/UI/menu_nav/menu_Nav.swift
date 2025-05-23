//
//  menu_Nav.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

import  SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            PantallaPrincipal()
                .tabItem { Label("Inicio", systemImage: "house.fill") }
            
            PantallaCriatura()
                .tabItem { Label("Criaturas", systemImage: "hare.fill") }
            
            PantallaMonstruo()
                .tabItem { Label("Monstruos", systemImage: "flame.fill") }
            
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
