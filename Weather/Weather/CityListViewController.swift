//
//  CityListViewController.swift
//  Weather
//
//  Created by 서시언 on 2021/08/19.
//

import UIKit

class CityListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var assetName: String?
    var countryName: String?
    var cities: [CityInfo] = []
    var cellIdentifier: String = "cityCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city: CityInfo = self.cities[indexPath.row]
        
        cell.cityNameLabel.text = city.cityName
        cell.temperatureLabel.text = city.getTemperature
        cell.rainfallRateLabel.text = city.getRainRate
        cell.weatherImageView.image = UIImage(named: city.imageName)
        switch city.imageName {
        case "sunny":
            cell.weatherState = "맑음"
        case "rainy":
            cell.weatherState = "비"
        case "cloudy":
            cell.weatherState = "구름"
        case "snowy":
            cell.weatherState = "눈"
        default:
            cell.weatherState = ""
        }
       
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: DetailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        guard let cell: CityTableViewCell = sender as? CityTableViewCell else {
            return
        }
        
        nextViewController.weatherImage = cell.weatherImageView.image
        nextViewController.rainfallRate = cell.rainfallRateLabel.text
        nextViewController.temperature = cell.temperatureLabel.text
        nextViewController.weatherState = cell.weatherState
        nextViewController.cityName = cell.cityNameLabel.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationItem.title = self.countryName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName ?? "") else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([CityInfo].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }

}
