//
//  ApodView.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import SwiftUI

struct ApodView: View{
    @StateObject var viewModel = ApodViewModel()
    
    fileprivate func apodItem(_ apod: Apod) -> some View{
        AsyncImage(url: URL(string: apod.url)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 300, maxHeight: 100)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }}
    }
    
    fileprivate func GetView() -> some View {
        Group{
            if viewModel.apod != nil {
                apodItem(viewModel.apod!)
            }else{
                ProgressView()
            }
        }
            .task {
                await viewModel.getApod()
            }.alert("Error", isPresented: $viewModel.hasError) {
            } message: {
                Text(viewModel.errorMessage)
            }
    }
    
    
    var body: some View{
        GetView()
    }
}

struct ApodView_Preview: PreviewProvider{
    static var previews: some View{
        ApodView()
    }
}
