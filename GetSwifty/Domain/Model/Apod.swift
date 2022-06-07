//
//  Apod.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import Foundation

struct Apod: Identifiable{
    let id: String // It must be UUID as string
    let copyright: String
    let date: String
    let explanation: String
    let hdUrl: String
    let title: String
    let url: String
}
