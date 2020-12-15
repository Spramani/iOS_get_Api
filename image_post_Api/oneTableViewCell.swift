//
//  oneTableViewCell.swift
//  image_post_Api
//
//  Created by MAC on 15/12/20.
//

import UIKit

class oneTableViewCell: UITableViewCell {

    @IBOutlet weak var emails: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var imgview: UIImageView!    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgview.layer.cornerRadius = 40
        imgview.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
