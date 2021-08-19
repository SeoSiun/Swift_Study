//
//  CountryTableViewCell.swift
//  Weather
//
//  Created by 서시언 on 2021/08/19.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    var assetName: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
