//
//  CoreFacade.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

public class CoreFacade {
    
    private let jobController: JobController
    private let studentController: StudentController
    private let companyController: CompanyController

    public var students: [Student] {
        return self.studentController.students
    }
    
    public var companies: [Company] {
        return self.companyController.companies
    }
    
    public var jobs: [Job] {
        return self.jobController.jobs
    }
    
    // MARK: Singleton
    public static let shared: CoreFacade = CoreFacade()
    
    private init() {
        self.jobController = JobController()
        self.studentController = StudentController()
        self.companyController = CompanyController.shared
    }
    
    // MARK: Public Methods
    public func getJobList() -> [Job] {
        return self.jobController.jobList
    }
    
    public func getJob() -> Job {
        return self.jobController.fetchJob()
    }
    
    public func getCompany() -> Company {
        return self.companyController.generateStubCompany()
    }
}

// MARK: Students Methods
extension CoreFacade {
    public func fetchStudents(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        self.studentController.fetchStudents(onSuccess: onSuccess, onFail: onFail)
    }
}

// MARK: Companies Methods
extension CoreFacade {
    public func fetchCompanies(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        self.companyController.fetchCompanies(onSuccess: onSuccess, onFail: onFail)
    }
}

// MARK: Companies Methods
extension CoreFacade {
    public func fetchJobs(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        self.jobController.fetchJobs(onSuccess: onSuccess, onFail: onFail)
    }
}
