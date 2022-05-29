//
//  ContentViewModel.swift
//  SwiftUIMVVMApp (iOS)
//
//  Created by Ukrit Wattanakulchart on 29/5/2565 BE.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var model: Model
    
    init() {
        self.model = .init(products: [], total: 0, skip: 0, limit: 0)
    }
 
    func callRequest() async -> Model? {
        guard let url: URL = .init(string: "https://dummyjson.com/products") else {
            assertionFailure("Cannot get url from url string")
            return nil
        }
        let request: URLRequest = .init(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
            let model = try JSONDecoder().decode(Model.self, from: data)
            return model
        } catch {
            assertionFailure("Cannot decode product")
            return nil
        }
    }
}
