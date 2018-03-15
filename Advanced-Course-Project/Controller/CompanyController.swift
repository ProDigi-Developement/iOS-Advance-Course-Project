//
//  CompanyController.swift
//  Advanced-Course-Project
//
//  Created by Caio Dias on 2018-03-06.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CompanyController {
    
    internal private(set) var companies: [Company]!
    public static let shared: CompanyController = CompanyController()
    
    private init() {
        // Nothing :)
    }
    
    internal func fetchCompanies(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        FetchController.shared.fetchAllCompanies(onSuccess: { companies in
            self.companies = companies
            onSuccess()
        },
                                                onFail: { error in
                                                    onFail(error)
        })
    }
    
    public func listCompanies() -> [Company] {
        return generateStubCompanies()
    }
    
    public func getCompanyBy(job: Job) -> Company? {
        let companyList = self.generateStubCompanies()

        for company in companyList {
            if let jobs = company.jobs {
                if jobs.contains(job) {
                    return company
                }
            } else {
                // TOOD: Handle error scenario
                print("fuck 👹")
            }
        }
        
        return nil
    }
    
    public func generateStubCompany() -> Company {
        let company = Company(companyId: 0, name: "Some name", email: "Some email")
        
        return company
    }
    
    private func generateStubCompanies() -> [Company] {
        var stubCompanies = [Company]()
        let randomInt = Int(arc4random_uniform(16))
        
        for num in 0...randomInt {
            let company = Company(companyId: 0, name: "\(num)", email: "\(num)@email.com")

            stubCompanies.append(company)
        }
        
        return stubCompanies
    }
}
