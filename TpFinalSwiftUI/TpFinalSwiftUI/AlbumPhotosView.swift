//
//  AlbumPhotosView.swift
//  TpFinalSwiftUI
//
//  Created by digital on 13/12/2022.
//

import SwiftUI

struct AlbumPhotosView: View {
    @Binding var gallery:GalleryElement
    @ObservedObject var photoDownloader = UserPhotosDownloader()
    @State var triPhotosArray = Photos()
    var body: some View {
        Grid {
            ForEach(self.photoDownloader.photos){ photo in
                if(self.triPhotosArray.count == 3){
                    GridRow{
                        Text("UNe row")
                        AsyncImage(url: URL(string: self.triPhotosArray[0].url))
                        AsyncImage(url: URL(string: self.triPhotosArray[1].url))
                        AsyncImage(url: URL(string: self.triPhotosArray[2].url))
                    }
                }
            }
        }.onAppear{
            photoDownloader.downloadPhotos(urlString: "https://jsonplaceholder.typicode.com/photos?albumId=\(self.gallery.id)")
        }
    }
}

struct AlbumPhotosView_Previews: PreviewProvider {
    @State static var galleryElement = GalleryElement.defaultGalleryElement()
    static var previews: some View {
        AlbumPhotosView(gallery: $galleryElement)
    }
}
