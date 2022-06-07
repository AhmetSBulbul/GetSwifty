//
//  NasaRepositoryImpl.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

struct NasaRepositoryImpl: NasaRepository{
    let dataSource: NasaDataSource
    
    func getApod() async throws -> Apod {
        let _apod = try await dataSource.getApod()
        return _apod
    }
}
