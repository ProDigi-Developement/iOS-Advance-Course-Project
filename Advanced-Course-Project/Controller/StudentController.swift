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
        self.students = generateStubStundents()
    }
    
    internal func stubMethod() -> String {
        return "It's alive!"
    }
    
    private func generateStubStundents() -> [Student] {
        var stubStudents = [Student]()
        let randomInt = Int(arc4random_uniform(16))

        for num in 0...randomInt {
            let student = Student(studentId: 0, name: "\(num)", email: "\(num)@email.com")
            stubStudents.append(student)
        }
        
        return stubStudents
    }
}
