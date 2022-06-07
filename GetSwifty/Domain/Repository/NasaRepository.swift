//
//  NasaRepository.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

protocol NasaRepository{
    func getApod() async throws -> Apod
}
