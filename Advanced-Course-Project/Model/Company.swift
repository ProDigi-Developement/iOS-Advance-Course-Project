//
//  Company.swift
//  Advanced-Course-Project
//
//  Created by Guilherme Crozariol on 2018-03-01.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import ObjectMapper

public class Company: Mappable {
    
    public private(set) var companyId: Int?
    public private(set) var jobs: [Job]?
    public private(set) var name: String?
    public private(set) var email: String?
    public private(set) var logo: String?
    public private(set) var size: String?
    public private(set) var photo: String?
    public private(set) var contact: String?
    public private(set) var website: String?
    public private(set) var techStack: String?
    public private(set) var description: String?
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    private init() {
        // Do NOT use this constructor
    }
    
    // Constructor for minimal object
    internal init(companyId: Int, name: String, email: String) {
        self.companyId = companyId
        self.name = name
        self.email = email
    }
    
    public func mapping(map: Map) {
        companyId   <- map["companyId"]
        jobs        <- map["jobs"]
        name        <- map["name"]
        email       <- map["email"]
        logo        <- map["logo"]
        size        <- map["size"]
        photo       <- map["photo"]
        contact     <- map["contact"]
        website     <- map["website"]
        techStack   <- map["techStack"]
        description <- map["description"]
    }
    
    public func equalTo(rhs: Company) -> Bool {
        return self.email == rhs.email
    }
}

extension Company: Equatable {
    public static func == (lhs: Company, rhs: Company) -> Bool {
        return lhs.equalTo(rhs: rhs)
    }
}
