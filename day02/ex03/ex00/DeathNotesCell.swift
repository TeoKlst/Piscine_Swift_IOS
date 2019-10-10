//
//  DeathNotesCell.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/10.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class DeathNotesCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
//    @IBOutlet weak var deathreasonLabel: UILabel!
//    @IBOutlet weak var deathreasonLabel: UITextView!
    @IBOutlet weak var deathreasonLabel: UILabel!
    
    func setCell(deathNotePage: DeathNotePage) {
        nameLabel.text = deathNotePage.name
        deathreasonLabel.text = deathNotePage.deathreason
        dateLabel.text = deathNotePage.date
    }
    
}
