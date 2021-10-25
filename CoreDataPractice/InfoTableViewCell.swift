//
//  InfoTableViewCell.swift
//  CoreDataPractice
//
//  Created by RONICK on 2021/10/25.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var texttext: UILabel!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String, text: String) {
        self.name.text = name
        self.texttext.text = text
    }

}
