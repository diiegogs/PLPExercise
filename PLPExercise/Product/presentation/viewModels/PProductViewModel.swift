//
//  PProductViewModel.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//

import Foundation

class PProductViewModel: ObservableObject {
    @Published internal var controlNavigation: Bool = false
    
    internal func callProductListService() -> Void {
        
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp") else {
            print("URL INVALIDA")
            return
        }

        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error, !error.localizedDescription.isEmpty {
                print("error: \(error.localizedDescription)")
                return
            }
            
            if let statusCode = response as? HTTPURLResponse, (200...300).contains(statusCode.statusCode) {
                if let data = data {
                    let jsonData = try? JSONSerialization.jsonObject(with: data)
                    print("data: \(String(describing: jsonData))")
                } else {
                    print("error data response")
                    return
                }
            } else {
                print("Response invalid")
                return
            }
        }
        
        task.resume()
    }
    
}
