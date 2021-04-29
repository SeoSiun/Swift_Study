//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 서시언 on 2021/04/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{
    
    //MARK: - Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    //MARK: IBOutlets
    //instance property
    //이걸 해줘야 storyboard에서 viewController에서 이 프로퍼티를 쓸 수 있다.
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var progressSlider: UISlider!
    //프로퍼티의 이름을 바꾸면 storyboard의 view controller는 얘를 찾을 수 없다
    //이름을 바꾸면 잘못된 연결을 삭제해주거나, refactor-rename으로 바꿔야한다.
    
    //MARK: - Methods
    //MARK: Custom Method
    func initializePlayer(){
        guard let soundAsset:NSDataAsset = NSDataAsset(name:"sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다")
            return
        }
        do{
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        }catch let error as NSError{
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute,second,milisecond)
        
        self.timeLable.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
          
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializePlayer()
        // Do any additional setup after loading the view.
    }

    //인터페이스빌더에서 연결할 메소드는 IBAction을 붙여줘야 한다.
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.player?.play()
        }else{
            self.player?.pause()
        }
        
        if sender.isSelected{
            self.makeAndFireTimer()
        }else{
            self.invalidateTimer()
        }
    }
    
    //메소드도 마찬가지로 이름을 바꾸면 잘못된 연결을 삭제해주거나, refacor-rename을 통해 이름을 바꿔야 한다.

    @IBAction func sliderValueChange(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking{return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    // MARK: AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류 발생")
            return
        }
        
        let message: String
        message = "오디어 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default){
            (action:UIAlertAction)->Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }

}

 
