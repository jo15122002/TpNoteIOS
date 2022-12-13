//
//  AlbumPreviewCell.swift
//  TpFinalSwiftUI
//
//  Created by digital on 13/12/2022.
//

import SwiftUI

struct AlbumPreviewCell: View {
    @Binding var gallery:GalleryElement
    @ObservedObject var photosDownloader = UserPhotosDownloader()
    var networkManager = NetworkManager()
    var body: some View {
        VStack{
            Text(self.gallery.title)
            HStack{
                if(self.photosDownloader.photos.count > 0){
                    AsyncImage(url: URL(string: photosDownloader.photos[0].thumbnailURL))
                    AsyncImage(url: URL(string: photosDownloader.photos[1].thumbnailURL))
                    AsyncImage(url: URL(string: photosDownloader.photos[2].thumbnailURL))
                }
            }.onAppear{
                self.photosDownloader.downloadPhotos(urlString: "https://jsonplaceholder.typicode.com/photos?albumId=\(self.gallery.id)")
            }
        }
    }
}

struct AlbumPreviewCell_Previews: PreviewProvider {
    @State static var galleryElement = GalleryElement.defaultGalleryElement()
    static var previews: some View {
        AlbumPreviewCell(gallery: $galleryElement)
    }
}
