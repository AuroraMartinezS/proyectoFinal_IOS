//
//  pantalla_principal.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI
import SceneKit

struct PantallaPrincipal: View {
    var body: some View {
        ScrollView(){
            VStack{
                HStack(){
                    Divider()
                        .frame(width: 200, height: 2)
                        .background(Color.black) // or:
                        .border(Color("ColorDorado"), width: 2)
                    
                    Image("Icon")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Divider()
                        .frame(width: 200, height: 2)
                        .border(Color("ColorDorado"), width: 2)
                    
                }
                VStack(){
                    
                    Text("TITULO DE LA APP")
                        .font(Font.custom("The Wild Breath of Zelda", size: 40))
                        .foregroundStyle(Color("ColorOscuro"))
                    Text("LOREM IPSUM - AQUI LEUGO LA VAMOS A CAMBIAR")
                        .font(Font.custom("Poppins-Regular", size: 15))
                    
                    ZStack(alignment: .leading){
                        Image("imagenInicio")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            .padding(10)
                        Text("Conoce todo sobre las criaturas, monstruos y materiales de las vastas regiones de Hyrule.")
                            .background(Color("ColorCremaclaro"))
                            .padding(10)
                    }
                    
                    
                }
                .padding(10)
                
                //ESTO ES PARA EL MODELO 3D
                HStack(){
                    Text("SDJNFSJDFNSJDFJSDFJSDFJS")
                    SceneView(scene: SCNScene(named: models[0].nombreModelo)
                              , options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: 300, height: 300)
                    
                }
                .background(Color("ColorClaro"))
                
                
            }
            
        }
        .padding(20)
        .background(Color("ColorClaro"))
        
    }
}

//PARA EL MODELO 3D
struct modelo: Identifiable{
    var id: Int
    var nombre: String
    var nombreModelo: String
}

var models = [
    modelo(id: 0, nombre: "Korok", nombreModelo: "Makar_from_Wind_Waker_-_The_Legend_Of_Zelda.usdz")
]

#Preview {
    PantallaPrincipal()
}
