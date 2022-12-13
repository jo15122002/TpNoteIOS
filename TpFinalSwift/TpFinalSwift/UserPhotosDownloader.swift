//
//  UserAlbumDownloader.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import Foundation

class UserPhotosDownloader{
    @Published var photos = Photos()
    
    func downloadPhotos(urlString:String, callback: @escaping()->()){
        if let url = URL(string: urlString){
            let urlrequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlrequest){ data, response, err in
                if let d = data{
                    if let photos = try? JSONDecoder().decode(Photos.self, from: d){
                        DispatchQueue.main.async {
                            self.photos = photos
                            callback()
                        }
                    }
                }
            }.resume()
        }
    }
}
