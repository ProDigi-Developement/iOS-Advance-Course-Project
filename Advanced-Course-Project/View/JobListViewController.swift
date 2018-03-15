//
//  JobListViewController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class JobListViewController: UIViewController {
    
    @IBOutlet weak var jobTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    fileprivate let cellNameAndId: String = String(describing: JobTableCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTable.isHidden = true
        jobTable.delegate = self
        jobTable.dataSource = self
        self.jobTable.register(UINib(nibName: cellNameAndId, bundle: nil), forCellReuseIdentifier: cellNameAndId)
        
        NotificationCenter.default.addObserver(self, selector: #selector(JobListViewController.updateTableList),
                                               name: NSNotification.Name(rawValue: kNOTIFICATION_JOB_LIST_CHANGED), object: nil)
    }
    
    @objc func updateTableList() {
        DispatchQueue.main.async {
            self.jobTable.reloadData()
            self.jobTable.contentOffset = .zero
            
            self.spinner.stopAnimating()
            self.jobTable.isHidden = false
        }
    }
}

extension JobListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreFacade.shared.getJobList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
//        let job = CoreFacade.shared.getJobList()[indexPath.row]
        let rawCell = tableView.dequeueReusableCell(withIdentifier: cellNameAndId)
        
        guard let jobCell = rawCell as? JobTableCell else {
            //TODO: log error
            return rawCell!
        }
        
        jobCell.setJobTitle("Title")
        jobCell.setCompany("Company")
        jobCell.setDate("Date")
        
        return jobCell
    }
}

extension JobListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showJobDetail", sender: nil)
    }
}
