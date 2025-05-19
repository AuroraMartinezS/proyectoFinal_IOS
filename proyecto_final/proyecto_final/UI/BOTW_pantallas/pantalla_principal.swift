//
//  pantalla_principal.swift
//  proyecto_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

struct PantallaPrincipal: View {
    var body: some View {
        VStack{
            HStack(){
                Divider()
                    .frame(width: 200, height: 2)
                    .background(Color.black) // or:
                    .border(Color.black, width: 2)

                Image("Icon")
                    .resizable()
                    .frame(width: 70, height: 70)
                Divider()
                    .frame(width: 200, height: 2)
                    .border(Color.black, width: 2)

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
           
            
        }
        .background(Color("ColorClaro"))
       
    }
        
}


#Preview {
    PantallaPrincipal()
}
