//
//  ViewController.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreFacade.shared.fetchStudents(onSuccess: {
            for student in CoreFacade.shared.students {
                print("Student email: \(student.email ?? "empty")")
            }
        },
                                        onFail: { error in
            print("ERROR! \(error.localizedDescription)")
        })
    }
}
