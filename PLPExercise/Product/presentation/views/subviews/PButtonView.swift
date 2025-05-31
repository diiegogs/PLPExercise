//
//  PButtonView.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import SwiftUI

struct PButtonView: View {
    internal var actionListProduct: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                actionListProduct()
            } label: {
                ZStack {
                    Color.blue
                        .cornerRadius(10.0)
                        .shadow(color: .white.opacity(0.002), radius: 5, x: 0, y: 2)
                    VStack {
                        HStack {
                            Text("Listado de Productos")
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                            
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 14.0, height: 14.0)
                        }
                    }
                }
                .scaledToFit()
            }
            .buttonStyle(.plain)
            Spacer()
        }
    }
}

#Preview {
    PButtonView { }
}
