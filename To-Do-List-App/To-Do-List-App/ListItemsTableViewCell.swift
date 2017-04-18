//
//  ListItemsTableViewCell.swift
//  To-Do-List-App
//
//  Created by Prathiba Lingappan on 3/1/17.
//  Copyright © 2017 Prathiba Lingappan. All rights reserved.
//

import UIKit

class ListItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickCheckButton(_ sender: UIButton) {
        
        if checkButton.isHighlighted {
            checkButton.isHighlighted = false
        }else{
            checkButton.isHighlighted = true
        }
    }
    
}
