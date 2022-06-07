//
//  GetApod.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//



enum UseCaseError: Error{
    case networkError, decodingError, badReq, apiError
}

protocol GetApod {
    func execute() async -> Result<Apod, UseCaseError>
}

import Foundation

struct GetApodUseCase: GetApod{
    let repo: NasaRepository
    func execute() async -> Result<Apod, UseCaseError> {
        do{
            let apod = try await repo.getApod()
            return .success(apod)
        }catch(let error){
            switch(error){
            case NasaApiServiceError.decodingError:
                return .failure(.decodingError)
            case NasaApiServiceError.requestError:
                return .failure(.badReq)
            case NasaApiServiceError.badApiKey:
                return .failure(.apiError)
            default:
                return .failure(.networkError)
            }
        }
    }
    
    
}
