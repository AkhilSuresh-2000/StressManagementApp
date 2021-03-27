//
//  HealthNewsCell.swift
//  StressManagementApp
//
//  Created by Akhil Suresh on 2021-03-25.
//

import UIKit

class HealthNewsCell: UITableViewCell {
   
    //creating connections
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
