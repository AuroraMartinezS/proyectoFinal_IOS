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

            ScrollView(){
                VStack(){
                    
                    HStack(){
                        Divider()
                            .frame(width: 15, height: 2)
                            .background(Color.black) // or:
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
                        
                        HStack(){
                            Image("trifuerza")
                                .resizable()
                                .scaledToFill()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 30, height: 30)
                            Text("\(controlador.criatura_animal?.data.category ?? "Categoria")")
                                .font(Font.custom("Poppins-Regular", size: 15))
                                .bold()
                            

                        }
                        
                        AsyncImage(url: URL(string:controlador.criatura_animal?.data.image ?? "Imagen"))
                            { result in
                             result.image?
                                   .resizable()
                                   .scaledToFill()
                                  .aspectRatio(contentMode: .fit)
                                        }.frame(width: 220, height: 220)
                                        .padding(10)
                                        .shadow(color: Color("newPrimaryColor"), radius: 5, x: 0, y: 1)
                        Text("\(controlador.criatura_animal?.data.description ?? "Descripción Poppins")")
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.teal)
                            .padding(20)
                            .lineSpacing(8)
                        
                    }
                }
                .background(Color("ColorAzulAnimal"))
            }
        }
    }
}

#Preview {
    PantallaCriaturaIndividual()
        .environment(ControladorAplicacion())
}
