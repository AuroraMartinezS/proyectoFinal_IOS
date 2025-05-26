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
                        //ESTE HSTACK LLEVA EL TITULO
                        HStack(){
                            Divider()
                                .frame(width: 50, height: 2)
                                .background(Color.black) // or:
                                .border(Color("ColorDorado"), width: 2)

                            Text("CRIATURAS")
                                .font(Font.custom("The Wild Breath of Zelda", size:45))
                                .foregroundStyle(Color("ColorDorado"))
                            
                            Divider()
                                .frame(width: 50, height: 2)
                                .border(Color("ColorDorado"), width: 2)
                        }
                        //ESTE MUESTRA TODAS LAS CRIATURAS
                        LazyVStack{
                            ForEach(controlador.pagina_resultados!.data){ criatura in NavigationLink{PantallaCriaturaIndividual()
                            } label: {
                                ZStack(){
                                    //PARA EL PATRÓN DE FONDO
                                    Image("Patron1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: .infinity, height: 130, alignment: .topLeading)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    HStack(){
                                        AsyncImage(url: URL(string:criatura.image))
                                        { result in
                                            result.image?
                                                .resizable()
                                                .scaledToFill()
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(5)
                                        }
                                        .frame(width: 100, height: 100)
                                        .shadow(color: Color.black, radius: 5, x: 0, y: 1)
                                        .padding(10)
                                        
                                        VStack(alignment: .leading){
                                            Text("\(criatura.id)")
                                                .font(Font.custom("The Wild Breath of Zelda", size: 20))
                                                .foregroundStyle(Color("ColorCrema"))
                                            Text("\(criatura.name)")
                                                .font(Font.custom("The Wild Breath of Zelda", size: 34))
                                                .foregroundStyle(Color("ColorOscuro"))
                                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight:
                                                .infinity,alignment: .leading)
                                        
                                        Image(systemName: "chevron.right")
                                            .padding(15)
                                            .foregroundStyle(Color("ColorOscuro"))
                                            .font(.title2)
                                        
                                    } //DEL HSTACK
                                    .padding(1)
                                    .cornerRadius(5)
                                    
                                } //ZSTACK
                            }
                            .padding(10)
                            .simultaneousGesture(TapGesture().onEnded({controlador.descargar_animal_api(id: criatura.id)
                            }))}
                            .border(Color("ColorDorado"), width: 3)
                            .padding(5)
                            .border(Color("ColorDorado"), width: 3)
                            .background(Color("ColorCremaoscuro"))
                            .cornerRadius(5)
                        }
                    }
                } // ESTE PARENTESIIS ES DE ZSTACK
                .padding(20)
                .background(Color("ColorClaro"))
            }
        }
    }
}

#Preview {
    PantallaCriatura()
        .environment(ControladorAplicacion())
}
