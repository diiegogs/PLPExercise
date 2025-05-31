//
//  UCardView.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import SwiftUI

enum UModeCardEnum {
    case SELECTABLE
    case REGULAR
}

struct UCardView: View {
    private var modeCard: UModeCardEnum
    private var image: String
    private var name: String?
    private var price: Int?
    private var category: String?
    
    private var actionCard: (() -> Void)?
    
    init(
        modeCard: UModeCardEnum = .SELECTABLE,
        image: String,
        name: String? = nil,
        price: Int? = nil,
        category: String? = nil,
        actionCard: ( () -> Void)? = nil) {
            self.modeCard = modeCard
            self.image = image
            self.name = name
            self.price = price
            self.category = category
            self.actionCard = actionCard
        }
    
    var body: some View {
        Button {
            self.actionCard?()
        } label: {
            ZStack {
                Color.white
                    .cornerRadius(10.0)
                    .shadow(color: .gray.opacity(0.8), radius: 10.0, x: 2.0, y: 2.0)
                
                VStack(spacing: 10.0) {
                    if let img = URL(string: self.image) {
                        AsyncImage(url: img) { phase  in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            } else if let _ = phase.error {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.gray.opacity(0.8))
                            } else {
                                ProgressView()
                            }
                        }
                    }
                    
                    VStack(spacing: 7.0) {
                        if let name  {
                            Text(name)
                                .font(.system(size: 12, weight: .bold, design: .default))
                                .foregroundStyle(.black)
                                .multilineTextAlignment(modeCard == .SELECTABLE ? .leading : .center)
                                .frame(maxWidth: .infinity, alignment: modeCard == .SELECTABLE ? .leading : .center)
                        }
                        
                        if let price {
                            Text(price, format: .currency(code: "MXN"))
                                .font(.system(size: 10, weight: .bold, design: .default))
                                .foregroundStyle(.gray.opacity(0.9))
                                .multilineTextAlignment(modeCard == .SELECTABLE ? .leading : .center)
                                .frame(maxWidth: .infinity, alignment: modeCard == .SELECTABLE ? .leading : .center)
                        }
                        
                        Spacer()
                        
                        if let category = category {
                            Text(UCategoryCatalog.getCategoryProduct(codeCategory: category) ?? "")
                                .font(.system(size: 10, weight: .bold, design: .default))
                                .foregroundStyle(.gray.opacity(0.9))
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: modeCard == .SELECTABLE ? .leading : .center)
                }
                .padding()
            }
        }
        .disabled(modeCard == .SELECTABLE ? false : true)
    }
}

#Preview {
    UCardView(
        modeCard: .REGULAR,
        image: "https://elektraqa.vteximg.com.br/arquivos/ids/1141189/1009286.jpg?v=637691369840400000",
        name: "XBOX 360",
        price: 2000,
        category: "C"
    )
    .fixedSize(horizontal: false, vertical: true)
}
