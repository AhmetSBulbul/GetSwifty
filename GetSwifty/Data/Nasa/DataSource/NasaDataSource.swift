//
//  NasaDataSource.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

protocol NasaDataSource{
    func getApod() async throws -> [Apod]
}
