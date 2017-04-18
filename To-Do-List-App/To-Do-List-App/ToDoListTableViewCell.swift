//
//  ToDoListTableViewCell.swift
//  To-Do-List-App
//
//  Created by Prathiba Lingappan on 3/1/17.
//  Copyright © 2017 Prathiba Lingappan. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoListName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
