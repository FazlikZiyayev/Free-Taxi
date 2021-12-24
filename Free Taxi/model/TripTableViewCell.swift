//
//  TripTableViewCell.swift
//  Free Taxi
//
//  Created by Fazlik Ziyaev on 20/12/21.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var addressFrom: UILabel!
    @IBOutlet weak var addressTo: UILabel!
    @IBOutlet weak var timePeriod: UILabel!
    @IBOutlet weak var cartype: UIImageView!
    @IBOutlet weak var blockView: UIView!
    @IBOutlet weak var lightGrayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        blockView.layer.borderWidth = 1
        blockView.layer.borderColor = UIColor(named: "light_light_gray")?.cgColor
        blockView.layer.cornerRadius = 20
        
        lightGrayView.layer.cornerRadius = 20
        lightGrayView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
