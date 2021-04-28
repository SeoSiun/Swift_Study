//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 서시언 on 2021/04/28.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    //instance property
    //이걸 해줘야 storyboard에서 viewController에서 이 프로퍼티를 쓸 수 있다.
    @IBOutlet var playRauseButton: UIButton!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var progessSlider: UISlider!
    //프로퍼티의 이름을 바꾸면 storyboard의 view controller는 얘를 찾을 수 없다
    //이름을 바꾸면 잘못된 연결을 삭제해주거나, refactor-rename으로 바꿔야한다.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //인터페이스빌더에서 연결할 메소드는 IBAction을 붙여줘야 한다.
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        print("button tapped")
    }

    @IBAction func sliderValueChange(_ sender: UISlider) {
        print("slider value changed")
    }
    //메소드도 마찬가지로 이름을 바꾸면 잘못된 연결을 삭제해주거나, refacor-rename을 통해 이름을 바꿔야 한다.

}

 
