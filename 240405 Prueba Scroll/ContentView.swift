//
//  ContentView.swift
//  240405 Prueba Scroll
//
//  Created by Luis on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var  queVista : Bool = true
    var body: some View {
        
        VStack {
            if queVista{
                Text("Vertical")
                    .font(.title)
                    .bold()
                    .padding(5)
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(15)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2))
                    
                Button("Cambio a Horizontal"){
                    queVista.toggle()
                }.buttonStyle(TresDButtonStyle())
                ScrollView{
                    VStack{
                        DatosCarrusel()
                    }
                }
            } else {
                Text("Horizontal")
                    .font(.title)
                    .bold()
                    .padding(5)
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(15)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2))
                Button("Cambio a Vertical"){
                    queVista.toggle()
                }.buttonStyle(TresDButtonStyle())
                ScrollView(.horizontal){
                    HStack{
                        DatosCarrusel()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct DatosCarrusel: View {
    var body: some View {
        Group {
            VistaCarrusel(imagen: "link", textoTitulo: "Link", textoDescripcion: "El Heroe del Tiempo", textoAutor: "Tingle").frame(width: 300)
            VistaCarrusel(imagen: "zelda", textoTitulo: "Zelda", textoDescripcion: "La Princesa de Hyrule", textoAutor: "Sheikah").frame(width: 300)
            VistaCarrusel(imagen: "ganon2", textoTitulo: "Ganondorf", textoDescripcion: "Malvado perseguidor de la Trifuerza", textoAutor: "Fotografa Gerudo").frame(width: 300)
            VistaCarrusel(imagen: "sheik", textoTitulo: "Sheik", textoDescripcion: "La identidad secreta de ???", textoAutor: "La Hyliana").frame(width: 300)
        }.frame(width: 380)
    }

}

struct TresDButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(.white)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .shadow(color: .black, radius: configuration.isPressed ? 0 : 5, x: 0, y: configuration.isPressed ? 0 : 5)
                        .opacity(configuration.isPressed ? 0.8 : 1)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.5))
                        .padding(2)
                        .blur(radius: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.2), lineWidth: 2)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



