//
//  NasaAPIImpl.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

enum NasaApiServiceError: Error{
    case badUrl, badApiKey, requestError, decodingError, statusNotOK
}


struct NasaAPIImpl: NasaDataSource{
    func getApod() async throws -> Apod {
        guard let apiKey = Bundle.main.infoDictionary?["NASA_API_KEY"] as? String else {
            throw NasaApiServiceError.badApiKey
        }
        
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)") else{
            throw NasaApiServiceError.badUrl
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw NasaApiServiceError.requestError
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NasaApiServiceError.statusNotOK
        }
        
        guard let result = try? JSONDecoder().decode(ApodAPIEntity.self, from: data) else {
            throw NasaApiServiceError.decodingError
        }
        
        return Apod(id: UUID().uuidString, copyright: result.copyright, date: result.date, explanation: result.explanation, hdUrl: result.hdurl, title: result.title, url: result.url)
        
    }
    
   
    
    
}
