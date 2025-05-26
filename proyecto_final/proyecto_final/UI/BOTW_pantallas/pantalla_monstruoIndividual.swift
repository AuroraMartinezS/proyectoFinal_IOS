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
                    HStack(){
                        Divider()
                            .frame(width: 15, height: 2)
                            .background(Color.black) // or:
                            .border(Color("ColorAzulMarino"), width: 2)

                        Text("\(controlador.monstruo_individual?.data.name ?? "nombre del monstruo")" )
                        .textCase(.uppercase)
                        .font(Font.custom("The Wild Breath of Zelda", size:30))
                        .foregroundStyle(Color("ColorAzulMarino"))
                        
                        Divider()
                            .frame(width: 15, height: 2)
                            .border(Color("ColorAzulMarino"), width: 2)

                    }
                    
                    VStack(){
                        
                        HStack(){
                            Image("CategoriaMonstruo")
                                .resizable()
                                .scaledToFill()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 60, height: 60)
                            Text(" \(controlador.monstruo_individual?.data.category ?? "Categoria")")
                                .foregroundStyle(Color("ColorAzulTxt"))
                                .font(Font.custom("Poppins-Regular", size: 15))
                                .textCase(.uppercase)
                                .bold()
                        }
                        
                        AsyncImage(url: URL(string:controlador.monstruo_individual?.data.image ?? "Imagen"))
                        { result in
                            result.image?
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fit)
                        }.frame(width: 220, height: 220)
                            .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                            .border(Color("ColorAzulBordes"), width: 3)
                            .padding(7)
                            .border(Color("ColorAzulBordes"), width: 3)
                            .padding(10)
                        Text("\(controlador.monstruo_individual?.data.description ?? "Descripción del Monstruo")")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .padding(20)
                            .foregroundStyle(Color("ColorAzulTxt"))
                            .lineSpacing(8)
                        
                        if let ubicaciones = controlador.monstruo_individual?.data.common_locations {
                            DisclosureGroup("Ubicaciones Comunes") {
                                VStack(alignment: .leading) {
                                    ForEach(ubicaciones, id: \.self) { ubicacion in
                                        HStack(){
                                            Image(systemName: "location.fill")
                                            Text("\(ubicacion)")
                                                .foregroundStyle(Color("ColorAzulTxt"))
                                        }
                                       
                                    }
                                }
                                .padding(.top, 5)
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(Color("ColorAzulMarino"))
                            .bold()
                            .animation(.easeInOut, value: ubicaciones)
                        }
                    }
                    .padding(10)
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    PantallaMonstruosIndividual()
        .environment(ControladorAplicacion())
}
