//
//  CompanyController.swift
//  Advanced-Course-Project
//
//  Created by Caio Dias on 2018-03-06.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CompanyController {
    
    public static let shared: CompanyController = CompanyController()
    
    internal private(set) var company: Company!
    internal private(set) var companies: [Company]!
    
    internal fileprivate(set) var companyList: [Company] {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNOTIFICATION_JOB_LIST_CHANGED), object: nil)
        }
    }
    
    internal init() {
        self.companyList = []
    }
    
    public func fetchCompany() -> Company {
        return fetchCompanies()[0]
    }
    
    public func fetchCompanies() -> [Company] {
        return companies
    }
    
    internal func fetchCompanies(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        FetchController.shared.fetchAllCompanies(onSuccess: { companies in
            self.companies = companies
            self.companyList = companies
            onSuccess()
        }, onFail: { error in
            onFail(error)
        })
    }
    
    public func getCompanyBy(job: Job) -> Company? {
        let companyList = self.companyList
        
        if companyList.count > 0 {
            for company in companyList {
                return company
            }
        } else {
            print("Error")
        }
        
        return nil
    }
}
