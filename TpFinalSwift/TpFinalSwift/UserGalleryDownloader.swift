//
//  UserGalleryDownloader.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import Foundation

class UserGalleryDownloader{
    @Published var galleries = Gallery()
    
    func downloadGalleries(urlString:String, callback: @escaping()->()){
        if let url = URL(string: urlString){
            let urlrequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlrequest){ data, response, err in
                if let d = data{
                    if let galleries = try? JSONDecoder().decode(Gallery.self, from: d){
                        DispatchQueue.main.async {
                            self.galleries = galleries
                            callback()
                        }
                    }
                }
            }.resume()
        }
    }
}
