//
//  pantalla_criaturaIndividual.swift
//  proyecto_final
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct PantallaCriaturaIndividual: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack(){
            Image("patronFondo")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .frame(width: .infinity, height: .infinity, alignment:.topLeading)
            ScrollView(){
                VStack(){
                    //PARA EL TÍTULO DEL ANIMAL
                    HStack(){
                        Divider()
                            .frame(width: 15, height: 2)
                            .background(Color.black)
                            .border(Color("ColorDorado"), width: 2)

                        Text("\(controlador.criatura_animal?.data.name ?? "nombre del animal")" )
                            .textCase(.uppercase)
                            .font(Font.custom("The Wild Breath of Zelda", size:30))
                            .foregroundStyle(Color("ColorDorado"))
                        
                        Divider()
                            .frame(width: 15, height: 2)
                            .border(Color("ColorDorado"), width: 2)
                    }
                    
                    VStack(){
                        //PARA LA CATEGORÍA, IMAGEN, DESCRIPCIÓN
                        HStack(){
                            Image("CategoriaAnimal")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            Text(" \(controlador.criatura_animal?.data.category ?? "Categoria")")
                                .foregroundStyle(Color("ColorFiltro"))
                                .font(Font.custom("Poppins-Regular", size: 15))
                                .textCase(.uppercase)
                                .bold()
                        }
                        
                        AsyncImage(url: URL(string:controlador.criatura_animal?.data.image ?? "Imagen"))
                            { result in
                             result.image?
                                   .resizable()
                                   .scaledToFill()
                                   .aspectRatio(contentMode: .fit)
                            }.frame(width: 220, height: 220)
                             .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                             .border(Color("ColorDorado"), width: 3)
                             .padding(7)
                             .border(Color("ColorDorado"), width: 3)
                             .padding(10)
                        
                        Text("\(controlador.criatura_animal?.data.description ?? "Descripción Poppins")")
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color("ColorFiltro"))
                            .padding(20)
                            .lineSpacing(8)
                        
                        
                        if let ubicaciones = controlador.criatura_animal?.data.common_locations {
                            DisclosureGroup("Ubicaciones Comunes") {
                                VStack(alignment: .leading) {
                                    ForEach(ubicaciones, id: \.self) { ubicacion in
                                        HStack(){
                                            Image(systemName: "location.fill")
                                            Text("\(ubicacion)")
                                                .foregroundStyle(Color("ColorFiltro"))
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(Color("ColorDorado"))
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
    PantallaCriaturaIndividual()
        .environment(ControladorAplicacion())
}
