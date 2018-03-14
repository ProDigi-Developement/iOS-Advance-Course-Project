//
//  NetworkManager.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-13.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias studentSuccess = (Student) -> Void
typealias companySuccess = (Company) -> Void
typealias companyJob = (Job) -> Void

class NetworkManager {
    
    class func fetchStudent(url: String, handler: @escaping studentSuccess) {
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Student>) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                handler(value)
            }
        }
    }
    
    class func fetchCompany(url: String, handler: @escaping companySuccess) {
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Company>) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                handler(value)
            }
        }
    }
    
    class func fetchJob(url: String, handler: @escaping companyJob) {
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Job>) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                handler(value)
            }
        }
    }
}
