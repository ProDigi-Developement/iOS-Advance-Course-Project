//
//  Student.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Student: Mappable {
    
    public private(set) var name: String?
    public private(set) var goal: String?
    public private(set) var term: String?
    public private(set) var photo: String?
    public private(set) var github: String?
    public private(set) var project: String?
    public private(set) var linkedIn: String?
    public private(set) var education: String?
    public private(set) var certification: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
        name            <- map["name"]
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
    
    public func setName(_ name: String) {
        self.name = name
    }
    
    public func setGoal(_ goal: String) {
        self.goal = goal
    }
    
    public func setTerm(_ term: String) {
        self.term = term
    }
    
    public func setPhoto(_ photo: String) {
        self.photo = photo
    }
    
    public func setGithub(_ github: String) {
        self.github = github
    }
    
    public func setProject(_ project: String) {
        self.project = project
    }
    
    public func setLinkedIn(_ linkedIn: String) {
        self.linkedIn = linkedIn
    }
    
    public func setEducation(_ education: String) {
        self.education = education
    }
    
    public func setCertification(_ certification: String) {
        self.certification = certification
    }
}
