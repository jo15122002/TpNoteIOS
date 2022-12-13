//
//  UserGalleriesViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import UIKit

class UserGalleriesViewController: UICollectionViewController {
    var selectedAlbumId:Int = 0
    @IBOutlet var userGalleriesCollectionView: UICollectionView!
    var userGalleriesDownloader = UserGalleryDownloader()
    var userPhotosDownloader = UserPhotosDownloader()
    var networkManager = NetworkManager()
    var userId:Int = 1
    var userGalleries = Gallery(){
        didSet{
            self.userGalleriesCollectionView.reloadData()
        }
    }
    var userPhotos = Photos(){
        didSet{
            self.userGalleriesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userGalleriesDownloader.downloadGalleries(urlString: "http://jsonplaceholder.typicode.com/albums?userId=\(self.userId)") {
            self.userGalleries = self.userGalleriesDownloader.galleries
        }
        self.userPhotosDownloader.downloadPhotos(urlString: "https://jsonplaceholder.typicode.com/photos") {
            self.userPhotos = self.userPhotosDownloader.photos
        }
        self.userGalleriesCollectionView.delegate = self
        self.userGalleriesCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = userGalleriesCollectionView.dequeueReusableCell(withReuseIdentifier: "album", for: indexPath) as! AlbumViewCell
        let index = indexPath[0] + indexPath[1]
        let albumId = self.userGalleries[index].id
        let albumPhotos = self.getAlbumPhotosByAlbumId(albumId: albumId)
        if(albumPhotos.count > 0){
            self.networkManager.downloadImage(urlString: albumPhotos[0].thumbnailURL, callBack: { image in
                cell.thumbnail1.image = image
            })
            self.networkManager.downloadImage(urlString: albumPhotos[1].thumbnailURL, callBack: { image in
                cell.thumbnail2.image = image
            })
            self.networkManager.downloadImage(urlString: albumPhotos[2].thumbnailURL, callBack: { image in
                cell.thumbnail3.image = image
            })
        }
        cell.albumTitle.text = self.userGalleries[index].title
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return userGalleries.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func getAlbumPhotosByAlbumId(albumId:Int) -> Photos{
        var res = Photos()
        for photo in self.userPhotos{
            if photo.albumID == albumId{
                res.append(photo)
            }
        }
        return res
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath[0] + indexPath[1]
        let albumId = self.userGalleries[index].id
        self.selectedAlbumId = albumId
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let id = segue.identifier{
            if id == "toAlbumPhotos"{
                if let dest = segue.destination as? AlbumPhotosViewController{
                    dest.albumId = self.selectedAlbumId
                }
            }
        }
    }

}
