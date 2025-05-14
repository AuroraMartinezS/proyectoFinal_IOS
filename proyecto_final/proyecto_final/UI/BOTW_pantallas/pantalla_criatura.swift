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
                        
                        
                        LazyVStack{
                            ForEach(controlador.pagina_resultados!.data){ criatura in NavigationLink{PantallaCriaturaIndividual()
                            } label: {
                                
                                VStack(){
                                    Text("\(criatura.name) y id: \(criatura.id)")
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .padding(20)
                                    AsyncImage(url: URL(string:criatura.image))
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
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_animal_api(id: criatura.id)
                            }))
                            }
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
