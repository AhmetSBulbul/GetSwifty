//
//  ApodViewModel.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

@MainActor
class ApodViewModel: ObservableObject{
    let getApodUseCase = GetApodUseCase(repo: NasaRepositoryImpl(dataSource: NasaAPIImpl()))
    @Published var apod: Apod? = nil
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var isLoaded = false
    
    func getApod() async {
        errorMessage = ""
        let result = await getApodUseCase.execute()
        switch(result){
        case .success(let apod):
            isLoaded = true
            self.apod = apod
        case .failure(let error):
            errorMessage = error.localizedDescription
            self.apod = nil
            hasError = true
        }
    }
}
