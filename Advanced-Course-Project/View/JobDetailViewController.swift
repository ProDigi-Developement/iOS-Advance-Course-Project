//
//  JobDetailViewController.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-09.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var benefitsLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var postingDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func companyDetailButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showCompanyDetail", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let job = CoreFacade.shared.getJob()
        
        titleLabel.text = job.title
        salaryLabel.text = job.salary
        benefitsLabel.text = job.benefits
        startDateLabel.text = job.startDate
        postingDateLabel.text = job.postingDate
        descriptionLabel.text = job.description
    }
    
}
