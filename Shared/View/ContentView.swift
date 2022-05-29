//
//  ContentView.swift
//  Shared
//
//  Created by Ukrit Wattanakulchart on 29/5/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        NavigationView {
            List {
                ForEach((viewModel.model.products), id: \.id) { product in
                    HStack {
                        GeometryReader { proxy in
                            AsyncImage(url: .init(string: product.thumbnail)) { image in
                                image.resizable().scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        .frame(width: 125)
                        
                        VStack(alignment: .leading) {
                            Text(product.brand)
                                .font(.subheadline)
                            Text(product.description)
                                .font(.caption2)
                            
                            HStack {
                                Spacer()
                                Button(action: {}) {
                                    Text(product.price.toString)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .padding(4)
                                }
                                .frame(width: 80, height: 30)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            }
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
                viewDidLoad()
            }
            .navigationTitle("Products")
        }
    }
}

private extension ContentView {
    func viewDidLoad() {
        Task {
            if let model = await viewModel.callRequest() {
                viewModel.model = model
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ContentView()
//        view.viewModel.model = .init(
//            products: [
//                .init(id: 1,
//                      title: "iPhone13",
//                      description: "Awesome mobile phone",
//                      price: 500,
//                      discountPercentage: 15,
//                      rating: 5,
//                      stock: 10,
//                      brand: "Apple",
//                      category: "Random",
//                      thumbnail: "https://dummyjson.com/image/i/products/1/thumbnail.jpg",
//                      images: [])
//            ],
//            total: 1,
//            skip: 0,
//            limit: 1)
        return view
    }
}
