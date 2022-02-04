//
//  PersonListTableViewCell.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class PersonListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(name: String) {
        nameLabel.text = name
    }

}
