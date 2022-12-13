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
        ScrollView{
            Grid {
                if(self.photoDownloader.photos.count > 0){
                    ForEach(0..<photoDownloader.photos.chunked(into: 3).count){index in
                        Text("Une row")
                        GridRow{
                            if(photoDownloader.photos.chunked(into: 3)[index].count>0){
                                AsyncImage(url: URL(string: photoDownloader.photos.chunked(into: 3)[index][0].url)).frame(width: 10, height: 10).scaledToFit()
                            }
                            if(photoDownloader.photos.chunked(into: 3)[index].count>1){
                                AsyncImage(url: URL(string: photoDownloader.photos.chunked(into: 3)[index][1].url)).frame(width: 10, height: 10).scaledToFit()
                            }
                            if(photoDownloader.photos.chunked(into: 3)[index].count>2){
                                AsyncImage(url: URL(string: photoDownloader.photos.chunked(into: 3)[index][2].url)).frame(width: 10, height: 10).scaledToFit()
                            }
                        }.frame(width: 300)
                    }
                }
            }.onAppear{
                photoDownloader.downloadPhotos(urlString: "https://jsonplaceholder.typicode.com/photos?albumId=\(self.gallery.id)")
            }
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct AlbumPhotosView_Previews: PreviewProvider {
    @State static var galleryElement = GalleryElement.defaultGalleryElement()
    static var previews: some View {
        AlbumPhotosView(gallery: $galleryElement)
    }
}
