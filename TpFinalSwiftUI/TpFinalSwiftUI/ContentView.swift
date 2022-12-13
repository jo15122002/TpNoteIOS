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
        List($downloader.users){user in
            NavigationLink{
                UserAlbumsView(user: user)
            } label: {
                UserCellView(user: user)
            }
        }.onAppear{
            if(downloader.users.count <= 1){
                downloader.download(urlString: "https://jsonplaceholder.typicode.com/users")
            }
        }.navigationTitle("User list")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
