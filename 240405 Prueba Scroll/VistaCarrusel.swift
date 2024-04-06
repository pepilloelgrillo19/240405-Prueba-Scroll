//
//  VistaCarrusel.swift
//  240405 Prueba Scroll
//
//  Created by Luis on 5/4/24.
//

import SwiftUI

struct VistaCarrusel: View {
    var imagen:String
    var textoTitulo:String
    var textoDescripcion:String
    var textoAutor:String
    
    var body: some View {
        VStack {
            Image(imagen)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
            HStack {
                VStack (alignment: .leading){
                    Text(textoTitulo)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(textoDescripcion)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Foto realizada por \(textoAutor)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }.padding()
        }
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(.gray, lineWidth: 2))
        .padding([.top, .horizontal])
    }
}

struct VistaCarrusel_Previews: PreviewProvider {
    static var previews: some View {
        VistaCarrusel(imagen: "sheik", textoTitulo: "", textoDescripcion: "", textoAutor: "")
    }
}
