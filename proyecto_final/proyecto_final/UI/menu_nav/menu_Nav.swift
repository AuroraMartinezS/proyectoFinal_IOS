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
                //.badge(controlador.publicaciones.count)
            
            PantallaCriatura()
                .tabItem { Label("BOTW", systemImage: "gamecontroller.fill") }
            Text("Favoritos")
                .tabItem { Label("Favoritos", systemImage:"heart.fill") }

            
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
