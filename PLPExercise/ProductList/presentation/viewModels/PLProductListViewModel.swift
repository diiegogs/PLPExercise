//
//  PLProductListViewModel.swift
//  PLPExercise
//
//  Created by Juan Diego Garcia Serrano on 30/05/25.
//
import Foundation


class PLProductListViewModel: ObservableObject {
    @Published internal var showLottie: Bool = true
    @Published internal var controlNavigation: Bool = false
    internal var modelProducts: [Producto] = []
    internal var modelProduct: Producto?
    
    internal func callProductListService() -> Void {
        
        DispatchQueue.main.async {
            self.showLottie = true
        }
        
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp") else {
            print("invalid URL")
            DispatchQueue.main.async {
                self.showLottie = false
            }
            return
        }
        
        let taskService = URLSession.shared.dataTask(with: url) { [weak self] dataResponse, response, error in
           if let statusCode = response as? HTTPURLResponse, (200...300).contains(statusCode.statusCode) {
                if let data = dataResponse {
                    do {
                        let dataResponse = try JSONDecoder().decode(PLProductListModelResponse.self, from: data)
                        self?.modelProducts = dataResponse.resultado.productos
                        print("success")
                        DispatchQueue.main.async {
                            self?.showLottie = false
                        }
                    } catch {
                        print("failure: \(error.localizedDescription)")
                        DispatchQueue.main.async {
                            self?.showLottie = false
                        }
                        return
                    }
                } else {
                    print("failure: dataResponse invalid")
                    DispatchQueue.main.async {
                        self?.showLottie = false
                    }
                    return
                }
            } else {
                print("failure: statusCode denied")
                DispatchQueue.main.async {
                    self?.showLottie = false
                }
                return
            }
        }
        
        taskService.resume()
    }
}
