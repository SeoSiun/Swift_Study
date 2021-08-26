//
//  ImageZoomUIViewController.swift
//  PhotosExample
//
//  Created by Terry on 2020/04/02.
//  Copyright © 2020 Terry. All rights reserved.
//

import UIKit
import Photos

class ImageZoomUIViewController: UIViewController,UIScrollViewDelegate {

    //asset property
    var asset: PHAsset!
    //이미지 요청
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    func viewForZooming(in ScrollView: UIScrollView) -> UIView? {
        //스크롤뷰 델리게이트 메소드, 줌 대상이 무엇인지 지정하는 메소드
        return self.imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //에셋에서 이미지를 호출해달라 라는
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in self.imageView.image = image})
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
