//
//  UserAlbumsView.swift
//  TpFinalSwiftUI
//
//  Created by digital on 13/12/2022.
//

import SwiftUI

struct UserAlbumsView: View {
    @Binding var user:User
    @ObservedObject var downloader = UserGalleryDownloader()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(self.$downloader.galleries){ gallery in
                    NavigationLink{
                        AlbumPhotosView(gallery: gallery)
                    } label:{
                        AlbumPreviewCell(gallery: gallery)
                    }
                }
            }.onAppear{
                if(downloader.galleries.count <= 1){
                    downloader.downloadGalleries(urlString: "http://jsonplaceholder.typicode.com/albums?userId=\(self.user.id)")
                }
            }
        }
    }
}

struct UserAlbumsView_Previews: PreviewProvider {
    @State static var user = User.defaultuser()
    static var previews: some View {
        UserAlbumsView(user: $user)
    }
}
