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
                    Image("patronFondo")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView{
                        HStack(){
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
                                    .frame(width: 130, height: 130)
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

                                } //DEL HSTACK
                                .padding(1)
                                .background(Color("ColorCremaoscuro"))
                                .cornerRadius(10)
                                
                                
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
