//
//  Student.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Student: Mappable {
    
    public private(set) var studentId: Int?
    public private(set) var name: String?
    public private(set) var email: String?
    public private(set) var goal: String?
    public private(set) var term: String?
    public private(set) var photo: String?
    public private(set) var resume: String?
    public private(set) var github: String?
    public private(set) var project: String?
    public private(set) var linkedIn: String?
    public private(set) var education: String?
    public private(set) var isVerified: String?
    public private(set) var certification: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    private init() {
        // Do NOT use this constructor
    }
    
    // Constructor for minimal object
    internal init(studentId: Int, name: String, email: String) {
        self.studentId = studentId
        self.name = name
        self.email = email
    }

    public func mapping(map: Map) {
        studentId       <- map["studentId"]
        name            <- map["name"]
        email           <- map["email"]
        goal            <- map["goal"]
        term            <- map["term"]
        photo           <- map["photo"]
        resume          <- map["resume"]
        github          <- map["github"]
        project         <- map["project"]
        linkedIn        <- map["linkedIn"]
        education       <- map["education"]
        isVerified      <- map["isVerified"]
        certification   <- map["certification"]
    }
}
