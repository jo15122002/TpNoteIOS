//
//  AlbumPhotosViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import Foundation
import UIKit

class AlbumPhotosViewController:UICollectionViewController{
    
    @IBOutlet var photosCollectionView: UICollectionView!
    var photosDownloader = UserPhotosDownloader()
    var networkManager = NetworkManager()
    var albumId:Int=0
    var userPhotos = Photos(){
        didSet{
            self.photosCollectionView.reloadData()
            print(self.userPhotos)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.albumId)
        self.photosDownloader.downloadPhotos(urlString: "https://jsonplaceholder.typicode.com/photos?albumId=\(self.albumId)") {
            self.userPhotos = self.photosDownloader.photos
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Int(self.userPhotos.count/3)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = self.photosCollectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! ImageViewCell
        if(self.userPhotos.count > 0){
            var index = indexPath[0] + indexPath[1]
            
            self.networkManager.downloadImage(urlString: self.userPhotos[index].thumbnailURL, callBack: { image in
                photoCell.photo.image = image
            })
        }
        
        return photoCell
    }
}
