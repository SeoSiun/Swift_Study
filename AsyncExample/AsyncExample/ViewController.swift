//
//  ViewController.swift
//  AsyncExample
//
//  Created by 서시언 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지뷰에 셋팅
        
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        
        let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
        
        
        OperationQueue().addOperation {
            // 아래 메소드는 동기 메소드이기 때문에 이게 끝날 때까지 다른 동작을 할 수 없음.
            // -> operation queue를 만들어서 백그라운드에서 실행하자.
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            // UI와 관련된 코드는 반드시 메인 쓰레드에서 동작해야 함.
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

