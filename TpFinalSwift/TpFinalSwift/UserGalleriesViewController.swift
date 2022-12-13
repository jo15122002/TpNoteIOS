//
//  UserGalleriesViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import UIKit

class UserGalleriesViewController: UICollectionViewController {
    @IBOutlet var userGalleriesCollectionView: UICollectionView!
    var userGalleriesDownloader = UserGalleryDownloader()
    var userId:Int = 1
    var userGalleries = Gallery(){
        didSet{
            self.userGalleriesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userGalleriesDownloader.downloadGalleries(urlString: "http://jsonplaceholder.typicode.com/albums?userId=\(self.userId)") {
            self.userGalleries = self.userGalleriesDownloader.galleries
        }
        self.userGalleriesCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = userGalleriesCollectionView.dequeueReusableCell(withReuseIdentifier: "album", for: indexPath)
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
