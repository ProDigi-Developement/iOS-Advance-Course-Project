//
//  JobController.swift
//  Advanced-Course-Project
//
//  Created by Araceli Teixeira on 04/03/18.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation

internal class JobController {
    
    public static let shared: JobController = JobController()
    
    internal private(set) var job: Job!
    internal private(set) var jobs: [Job]!
    
    internal fileprivate(set) var jobList: [Job] {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNOTIFICATION_JOB_LIST_CHANGED), object: nil)
        }
    }
    
    internal init() {
        self.jobList = []
    }
    
    public func fetchJob() -> Job {
        return fetchJobs()[0]
    }
    
    public func fetchJobs() -> [Job] {
        return jobs
    }
    
    internal func fetchJobs(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        FetchController.shared.fetchAllJobs(onSuccess: { jobs in
            self.jobs = jobs
            self.jobList = jobs
            onSuccess()
        }, onFail: { error in
            onFail(error)
        })
    }

}
