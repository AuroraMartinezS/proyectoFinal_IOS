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
                //ARREGLO EN LA PARTE SUPERIOR
                HStack(){
                    Divider()
                        .frame(width: 100, height: 2)
                        .background(Color.black)
                        .border(Color("ColorDorado"), width: 2)
                    
                    Image("Icon")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Divider()
                        .frame(width: 100, height: 2)
                        .border(Color("ColorDorado"), width: 2)
                    
                }
                VStack(){
                    //TÍTULO, DESCRIPCIÓN E IMAGEN
                    Text("HYRULE HAVEN")
                        .font(Font.custom("The Wild Breath of Zelda", size: 50))
                        .foregroundStyle(Color("ColorOscuro"))
                    ZStack(){
                        Text("Un pequeño rincón hyliano para aprender y conocer más sobre la fauna de Hyrule. ¡Aprende sobre todos los monstruos y animales que existen en todo el universo de BOTW!")
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .foregroundStyle(Color("ColorOscuro"))
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    
                    HStack(){
                        Image("ImgGaleria1")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            .border(Color("ColorDorado"), width: 3)
                            .padding(5)
                            .border(Color("ColorDorado"), width: 3)
                            .frame(height: 245)
                        VStack(){
                            Image("ImgGaleria2")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(5)
                                .border(Color("ColorDorado"), width: 3)
                                .padding(5)
                                .border(Color("ColorDorado"), width: 3)
                            Image("ImgGaleria3")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(5)
                                .border(Color("ColorDorado"), width: 3)
                                .padding(5)
                                .border(Color("ColorDorado"), width: 3)
                        }
                    }
                    
                    Divider()
                    .frame(width: 190, height: 2)
                    .border(Color("ColorDorado"), width: 2)
                    .padding(10)
                    
                    //MODELO 3D
                    Text("¡Interactua con nuestro pequeño Korok!")
                    .font(Font.custom("Poppins-Regular", size: 15))
                    .bold()
                    .foregroundStyle(Color("ColorOscuro"))
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    //ESTE DE ACA SIRVE PARA RENDERIZAR ESCENAS 3D.
                    //EL SCNSCENE CARGA UNA ESCENA 3D POR MEDIO DE UN ARCHIVO QUE LE PASEMOS.
                    //autoenablesDefaultLighting PERMITE AGREGAR UNA LUZ PARA QUE EL MODELO NO SE VEA TODO OSCURO
                    //allowCameraControl PERMITE CONTROLES AL USUARIO PARA HACER ZOOM, Y MOVIMENTO CON EL MOUSE
                    SceneView(scene: SCNScene(named: models[0].nombreModelo)
                              , options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: 320, height: 320)
                    .border(Color("ColorDorado"), width: 3)
                    .padding(5)
                    .border(Color("ColorDorado"), width: 3)
                    
                    
                    
                    
                }
                .padding(20)
                
            }

        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorClaro"), Color("ColorDorado")]), startPoint: .top, endPoint: .bottom)
            )
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
