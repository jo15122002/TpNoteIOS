//
//  UserJsonDownloader.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import Foundation

class UserJsonDownloader:ObservableObject{
    @Published var users = Users()
    
    func downloadUsers(urlString:String, callback: @escaping()->()){
        if let url = URL(string: urlString){
            let urlrequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlrequest){ data, response, err in
                if let d = data{
                    if let users = try? JSONDecoder().decode(Users.self, from: d){
                        DispatchQueue.main.async {
                            self.users = users
                            callback()
                        }
                    }
                }
            }.resume()
        }
    }
}
