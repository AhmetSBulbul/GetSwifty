//
//  ApodAPIEntity.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

struct ApodAPIEntity: Codable{
    let id: String // Must be uuid String
    let copyright: String
    let date: Date
    let explanation: String
    let hdUrl: URL
    let title: String
    let url: URL
    
}
