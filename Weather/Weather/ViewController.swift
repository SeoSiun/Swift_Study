//
//  ViewController.swift
//  Weather
//
//  Created by 서시언 on 2021/08/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    let cellIdentifier: String = "countryCell"
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryTableViewCell
        
        let country: Country = self.countries[indexPath.row]
        
        cell.titleLabel.text = country.koreanName
        cell.assetName = country.assetName
        cell.flagImage.image = UIImage(named: "flag_" + country.assetName)
       
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: CityListViewController = segue.destination as? CityListViewController else {
            return
        }
        
        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else {
            return
        }
        
        nextViewController.assetName = cell.assetName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }

}

