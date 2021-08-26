//
//  ViewController.swift
//  PhotosExample
//
//  Created by Terry on 2020/04/01.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit
import Photos

//PHPhotoLibraryChangeObserver: 라이브러리에 변화가 생기면 감지하겠다 라는 프로토콜
class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier: String = "cell"

    
    @IBAction func touchUPRefreeshButton(_ sender: UIBarButtonItem){
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //편집 모드로 들어왔을때 실행되는 메소드
            let asset: PHAsset = self.fetchResult[indexPath.row]
            
            PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.deleteAssets([asset] as NSArray)}, completionHandler: nil)
        }
    }

    //라이브러리에 변화가 생기면 감지하는 메소드
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
       }
       
    
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
    
    
    guard let cameraRollCollection = cameraRoll.firstObject else{
        return
    }
    
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        //사진첩 접근 유무 확인
        switch photoAurhorizationStatus {
        case .authorized:
            print("접근허가됨")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }

        case .denied:
            print("접근 불허")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({(status) in
                switch status{
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        @unknown default: break
            
        }
        
        //포토라이브러리가 변화될때마다 델리게이트 메소드가 호출 된다. 
        PHPhotoLibrary.shared().register(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.imageView?.image = image})
        return cell
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ImageZoomUIViewController = segue.destination as? ImageZoomUIViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        nextViewController.asset = self.fetchResult[index.row]
    }


}

