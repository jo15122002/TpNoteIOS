//
//  NetworkManager.swift
//  network
//
//  Created by digital on 30/11/2022.
//

import Foundation
import UIKit

class NetworkManager{
    static let instance = NetworkManager()
    
    func dataToImage(data:Data?)->UIImage?
    {
        if let d = data, let image = UIImage(data: d){
            return image
        }else{
            return nil
        }
    }
    
    func download(urlString:String, conversionFunction:@escaping (Data?)->(UIImage?), callBack:@escaping (UIImage?)->()) -> String{
        guard let url = URL(string: urlString) else {return "Url pas bonne"}
        let urlrequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlrequest){ data, response, err in
            
            guard err == nil else {
                print("une erreur est survenue")
                callBack(nil)
                return
            }
            
            DispatchQueue.main.async {
                callBack(conversionFunction(data))
            }
            
        }.resume()
        
        return "Success"
    }
    
    func downloadImage(urlString:String, callBack:@escaping(UIImage?)->()) -> String{
        return download(urlString: urlString, conversionFunction: dataToImage, callBack: callBack)
    }
}
