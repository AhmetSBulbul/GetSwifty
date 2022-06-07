//
//  ApodAPIEntity.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

struct ApodAPIEntity: Codable{
    let copyright: String
    let date: String
    let explanation: String
    let hdurl: String
    let title: String
    let url: String
    
}
