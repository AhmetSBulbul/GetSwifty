//
//  ContentView.swift
//  GetSwifty
//
//  Created by Ahmet Bülbül on 7.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Hello World")
            }
            .navigationTitle("Get Swifty!")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
