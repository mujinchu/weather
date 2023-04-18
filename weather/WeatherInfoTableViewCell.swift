//
//  WeatherInfoTableViewCell.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import UIKit

class WeatherInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var dayweatherLabel: UILabel!
    
    @IBOutlet weak var nightweatherLabel: UILabel!
    
    @IBOutlet weak var daytempLabel: UILabel!
    
    @IBOutlet weak var nighttempLabel: UILabel!
    
    @IBOutlet weak var daywindLabel: UILabel!
    
    @IBOutlet weak var nightwindLabel: UILabel!
    
    var live: Live? {
        didSet {
            guard let live = live else { return }
            print(live)
            dateLabel.text = live.date + "   " + live.weekStr
            dayweatherLabel.text = live.dayweather
            nightweatherLabel.text = live.nightweather
            daytempLabel.text = live.daytemp + "摄氏度"
            nighttempLabel.text = live.nighttemp + "摄氏度"
            daywindLabel.text = live.daywind + "风  " + live.daypower + "级"
            nightwindLabel.text = live.nightwind + "风   " + live.daypower + "级"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
