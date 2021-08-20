//
//  DetailViewController.swift
//  Weather
//
//  Created by 서시언 on 2021/08/20.
//

import UIKit

class DetailViewController: ViewController {
    var weatherImage: UIImage?
    var weatherState: String?
    var temperature: String?
    var rainfallRate: String?
    var cityName: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallRateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = weatherImage
        weatherStateLabel.text = weatherState
        temperatureLabel.text = temperature
        rainfallRateLabel.text = rainfallRate

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = self.cityName
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
