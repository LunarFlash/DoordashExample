//
//  TextEntryTableViewCell.swift
//  DoorDashExperiments
//
//  Created by Yi Wang on 2/18/22.
//

import UIKit

class TextEntryTableViewCell: UITableViewCell {
    
    static let reuseIdentifer = "TextEntryCell"

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
