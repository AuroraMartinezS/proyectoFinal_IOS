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
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if(controlador.pagina_resultados != nil){
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){ criatura in NavigationLink{
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)} label: {
                            VStack(){
                                Text("\(criatura.name)")
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
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaCriatura()
        .environment(ControladorAplicacion())
}
