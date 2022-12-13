//
//  ContentView.swift
//  TpFinalSwiftUI
//
//  Created by digital on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var downloader = UserDownloader()
    
    @State var userList = Users()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
