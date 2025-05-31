//
//  PProductScreen.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import SwiftUI

struct PProductScreen: View {
    @StateObject private var viewModel: PProductViewModel = PProductViewModel()
    
    private var product: Producto?
    
    init(product: Producto? = nil) {
        self.product = product
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack {
                    if let product {
                        UCardView(
                            modeCard: .REGULAR,
                            image: product.urlImagenes.first ?? "" ,
                            name: product.nombre,
                            price: product.precioRegular,
                            category: product.codigoCategoria.rawValue)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: geo.size.width * 0.9, alignment: .center)
                        
                        HStack {
                            Button { [weak viewModel] in
                                viewModel?.controlNavigation = true
                            } label: {
                                ZStack {
                                    Color.white.opacity(0.002)
                                    HStack {
                                        Spacer()
                                        
                                        Text("Ir a Listado de Productos")
                                            .font(.system(size: 12, weight: .bold, design: .default))
                                            .foregroundStyle(.blue)
                                        
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10.0, height: 10.0)
                                            .foregroundStyle(.blue)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.leading)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 30.0)
                        
                    } else {
                        PButtonView { [weak viewModel] in
                            viewModel?.controlNavigation = true
                        }
                    }
                }
                .padding()
                .navigationTitle("")
            }
            .navigationDestination(
                isPresented: $viewModel.controlNavigation,
                destination: {
                    PLProductListScreen()
                }
            )
            .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    PProductScreen()
}
