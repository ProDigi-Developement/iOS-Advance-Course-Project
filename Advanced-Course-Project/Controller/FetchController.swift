//
//  FetchController.swift
//  Advanced-Course-Project
//
//  Created by Caio Dias on 2018-03-13.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

internal class FetchController {
    public static let shared: FetchController = FetchController()
    
    private var token: String = ""
    private let username: String = "prodigiadvancedcourse@gmail.com"
    private let password: String = "prodigi123!@#"
    private let loginURL: String = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyB8m7LmEtH4wNjFKEfKnaUcUUJVdp1Ntx4"
    
    private init() {
        // Nothing :)
    }
    
    public func doLogin(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        guard let url = URL(string: loginURL) else {
            print("Couldn't get job list")
            return
        }
        
        let httpBody = ["email": username, "password": password, "returnSecureToken" : "true"]
        
        guard let httpBodyData = try? JSONSerialization.data(withJSONObject: httpBody, options: []) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = httpBodyData
        
        Alamofire.request(urlRequest).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    guard
                        let json = try? JSONSerialization.jsonObject(with: data, options: []),
                        let dictionary = json as? [String: Any],
                        let idToken = dictionary["idToken"] as? String
                        else {
                            print("Failed to get response data as json")
                            return
                    }
                    
                    self.token = idToken
                    onSuccess()
                }
                
            case .failure(let error):
                print("ERROR: \(error.localizedDescription)")
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
                
                onFail(error)
            }
        }
    }
}

// MARK: Students

extension FetchController {
    internal func fetchAllStudents(onSuccess: @escaping ([Student]) -> Void, onFail: @escaping (Error) -> Void) {
        self.doLogin(onSuccess: {
            let url: String = "https://pro-digi-advanced.firebaseio.com/student/studentId.json?auth=\(self.token)"
            
            Alamofire.request(url).validate().responseArray { (response: DataResponse<[Student]>) in
                switch response.result {
                case .success(let value):
                    onSuccess(value)
                case .failure(let error):
                    onFail(error)
                }
            }
        }, onFail: { error in
            // TODO: Handle error scenario
            print("ERROR: \(error.localizedDescription)")
        })
        
    }
}
