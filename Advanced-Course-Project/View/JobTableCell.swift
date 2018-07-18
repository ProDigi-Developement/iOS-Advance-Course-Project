//
//  JobTableCell.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class JobTableCell: UITableViewCell {
    @IBOutlet weak private var jobTitleLabel: UILabel!
    @IBOutlet weak private var companyLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setJobTitle(_ jobTitle: String) {
        jobTitleLabel.text = jobTitle
    }
    
    public func setCompany(_ company: String) {
        companyLabel.text = company
    }
    
    public func setDate(_ date: String) {
        dateLabel.text = date
    }
}
