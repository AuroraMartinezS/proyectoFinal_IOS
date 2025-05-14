//
//  pantalla_monstruoIndividual.swift
//  proyecto_final
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct PantallaMonstruosIndividual: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        ZStack(){
            Image("patronFondoIndividual")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            ScrollView(){
                VStack(){
                    Text("\(controlador.monstruo_individual?.data.name ?? "Nombre del Monstruo")" )
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding(10)
                        .foregroundStyle(Color.teal)
                    AsyncImage(url: URL(string:controlador.monstruo_individual?.data.image ?? "Imagen"))
                        { result in
                         result.image?
                               .resizable()
                               .scaledToFill()
                              .aspectRatio(contentMode: .fit)
                                    }.frame(width: 220, height: 220)
                                    .padding(10)
                                    .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                    Text("\(controlador.monstruo_individual?.data.description ?? "Descripción del Monstruo")")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.teal)
                                        .padding(20)
                                        .lineSpacing(8)
                }
            }
        }
    }
}

#Preview {
    PantallaMonstruosIndividual()
        .environment(ControladorAplicacion())
}
