//
//  pantalla_criatura.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

struct PantallaCriatura: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados != nil){
            NavigationStack{
                ZStack(){
                    ScrollView{
                        VStack(){
                            Text("CRIATURAS")
                            .font(Font.custom("The Wild Breath of Zelda", size:45))
                            .foregroundStyle(Color("ColorCrema"))
                        }

                        LazyVStack{
                            ForEach(controlador.pagina_resultados!.data){ criatura in NavigationLink{PantallaCriaturaIndividual()
                            } label: {
                                
                                HStack(){
                                    AsyncImage(url: URL(string:criatura.image))
                                    { result in
                                        result.image?
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(5)
                                    }
                                    .frame(width: 120, height: 120)
                                    .shadow(color: Color.black, radius: 5, x: 0, y: 1)
                                    .padding(10)
                                    
                                    
                                    VStack(alignment: .leading){
                                        Text("\(criatura.id)")
                                            .font(Font.custom("The Wild Breath of Zelda", size: 20))
                                            .foregroundStyle(Color("ColorOscuro"))
                                        Text("\(criatura.name)")
                                            .font(Font.custom("The Wild Breath of Zelda", size: 34))
                                            .foregroundStyle(Color("ColorOscuro"))
                                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(15)
                                        .foregroundStyle(Color("ColorOscuro"))
                                        .font(.title2)

                                } //DEL HSTACK
                                .padding(1)
                                .background(Color("ColorCremaoscuro"))
                                .cornerRadius(5)
                                
                                
                            }
                            .padding(10)
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_animal_api(id: criatura.id)
                            }))
                            } .background(Color("ColorCremaclaro"))
                        }
                    }
                } // ESTE PARENTESIIS ES DE ZSTACK
            }
        }
    }
}

#Preview {
    PantallaCriatura()
        .environment(ControladorAplicacion())
}
