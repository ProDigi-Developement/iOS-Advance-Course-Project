//
//  StubController.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Darwin
import Alamofire
import AlamofireObjectMapper

internal class StudentController {
    internal private(set) var students: [Student]!
    
    internal init() {
        self.students = [Student]()
        self.fetchStudents(onSuccess: {}, onFail: {_ in })
    }
    
    internal func fetchStudents(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        FetchController.shared.fetchAllStudents(onSuccess: { students in
            self.students = students
            onSuccess()
        },
                                                onFail: { error in
            onFail(error)
        })
    }
}
