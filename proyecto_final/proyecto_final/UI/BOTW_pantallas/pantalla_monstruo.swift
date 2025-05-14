//
//  pantalla_monstruo.swift
//  proyecto_final
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct PantallaMonstruo: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_monstruos != nil){
            NavigationStack{
                ZStack(){
                    Image("patronFondo")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView{

                        LazyVStack{
                            ForEach(controlador.pagina_resultados_monstruos!.data){ monstruo in NavigationLink{PantallaMonstruosIndividual()
                            } label: {
                                
                                VStack(){
                                    Text("\(monstruo.name) y id: \(monstruo.id)")
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .padding(20)
                                    AsyncImage(url: URL(string:monstruo.image))
                                    { result in
                                        result.image?
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .frame(width: 220, height: 220)
                                    .padding(20)
                                    .frame(maxWidth: .infinity)
                                    .shadow(color: Color.black, radius: 5, x: 0, y: 1)
                                }
                            }
                            /*.simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_animal_api(id: criatura.id)
                            }))*/
                            }
                        }
                    }
                } // ESTE PARENTESIIS ES DE ZSTACK
            }
        }
    }
}

#Preview {
    PantallaMonstruo()
        .environment(ControladorAplicacion())
}
