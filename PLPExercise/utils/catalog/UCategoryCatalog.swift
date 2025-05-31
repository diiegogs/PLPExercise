//
//  UCategoryCatalog.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 31/05/25.
//

import Foundation

class UCategoryCatalog {
    
    static func getCategoryProduct(codeCategory: String) -> String? {
        let uCategoryCatalogDictionary: [String: String] = [
            "MA": "Motocicletas y Accesorios",
            "TL": "Tecnología y Teléfonos",
            "C": "Electrónica y Controles"
        ]
        
        if let category = uCategoryCatalogDictionary[codeCategory] {
            return category
        } else {
            return nil
        }
    }
}
