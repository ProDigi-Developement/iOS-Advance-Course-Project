//
//  Company.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Company: Mappable {
    
    public private(set) var jobs: [Job]?
    public private(set) var name: String?
    public private(set) var size: String?
    public private(set) var photo: String?
    public private(set) var contact: String?
    public private(set) var website: String?
    public private(set) var techStack: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        jobs        <- map["jobs"]
        name        <- map["name"]
        logo        <- map["logo"]
        size        <- map["size"]
        contact     <- map["contact"]
        website     <- map["website"]
        techStack   <- map["techStack"]
        description <- map["description"]
    }
    
    public func setJobs(_ jobs: [Job]) {
        self.jobs = jobs
    }
    
    public func setName(_ name: String) {
        self.name = name
    }
    
    public func setSize(_ size: String) {
        self.size = size
    }
    
    public func setPhoto(_ photo: String) {
        self.photo = photo
    }
    
    public func setContact(_ contact: String) {
        self.contact = contact
    }
    
    public func setWebsite(_ website: String) {
        self.website = website
    }
    
    public func setTechStack(_ techStack: String) {
        self.techStack = techStack
    }
}
