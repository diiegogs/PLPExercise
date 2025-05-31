//
//  PLProductListScreen.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import SwiftUI

struct PLProductListScreen: View {
    @StateObject private var viewModel: PLProductListViewModel = PLProductListViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    HStack {
                        Button { [weak viewModel] in
                            viewModel?.controlNavigation = true
                        } label: {
                            ZStack {
                                Color.white.opacity(0.002)
                                HStack {
                                    Image(systemName: "arrow.left")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10.0, height: 10.0)
                                        .foregroundStyle(.blue)
                                    
                                    Text("Regresar")
                                        .font(.system(size: 12, weight: .bold, design: .default))
                                        .foregroundStyle(.blue)
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.leading)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.modelProducts.isEmpty {
                        //MARK: Create another view for empry products
                        VStack {
                            Image(systemName: "doc.plaintext")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .frame(width: geo.size.width * 0.4, height: geo.size.height / 3)
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    } else {
                        LazyVGrid(
                            columns: [
                                GridItem(.adaptive(minimum: 150))
                            ],
                            spacing: 20.0) {
                                ForEach(viewModel.modelProducts.indices, id: \.self) { content in
                                    UCardView(
                                        image: viewModel.modelProducts[content].urlImagenes.first ?? "",
                                        name: viewModel.modelProducts[content].nombre,
                                        price: viewModel.modelProducts[content].precioRegular,
                                        category: viewModel.modelProducts[content].codigoCategoria.rawValue
                                    ) { [weak viewModel] in
                                        viewModel?.modelProduct = viewModel?.modelProducts[content]
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            viewModel?.controlNavigation = true
                                        }
                                    }
                                }
                            }
                            .navigationTitle("")
                            .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            .onAppear { [weak viewModel] in
                viewModel?.callProductListService()
            }
            .fullScreenCover(isPresented: $viewModel.showLottie) {
                ProgressView("...")
                    .progressViewStyle(.circular)
                    .padding()
            }
            .navigationDestination(
                isPresented: $viewModel.controlNavigation,
                destination: {
                    PProductScreen(product: viewModel.modelProduct)
                }
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    PLProductListScreen()
}
