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
                        .frame(width: 100, height: 2)
                        .background(Color.black) // or:
                        .border(Color("ColorDorado"), width: 2)
                    
                    Image("Icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Divider()
                        .frame(width: 100, height: 2)
                        .border(Color("ColorDorado"), width: 2)
                    
                }
                VStack(){
                    
                    Text("HYRULE HAVEN")
                        .font(Font.custom("The Wild Breath of Zelda", size: 50))
                        .foregroundStyle(Color("ColorOscuro"))
                    Text("Un pequeño rincón hyliano para aprender y conocer más sobre la fauna de Hyrule. ¡Aprende sobre todos los monstruos y animales que existen en todo el universo de BOTW.")
                        .font(Font.custom("Poppins-Regular", size: 15))
                    
                    ZStack(alignment: .leading){
                        Image("imagenInicio")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(5)
                            .padding(15)
                    }
                    
                    Divider()
                    .frame(width: 190, height: 2)
                    .border(Color("ColorDorado"), width: 2)
                    .padding(10)
                    
                    Text("¡Interactua con nuestro pequeño Korok!")
                    .font(Font.custom("Poppins-Regular", size: 15))
                    .bold()
                    .italic()
                    SceneView(scene: SCNScene(named: models[0].nombreModelo)
                              , options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: 320, height: 320)
                    .border(Color("ColorDorado"), width: 6)
                    .cornerRadius(6)
                    
                    
                    
                    
                }
                .padding(20)

                .background(Color("ColorClaro"))
                
                
            }
            .background(Color("ColorClaro"))
        }
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
