//
//  DataEntry.swift
//  CSUF-Student-Form
//
//  Created by Charlie Buckets on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import Foundation

public class DataEntry : NSObject, NSCoding{
    
    // Persistence enumerator
    struct  DataEntryKey {
        static let firstNameKey = "firstName"
        static let lastNameKey = "lastName"
        static let emailAddress = "email"
        static let interestedProgramsOfStudy = "interestedProgramOfStudy"
        static let interestedMajorsOfStudy = "interesteedMajorsOfStudy"
        static let expectedStartTerm = "expectedStartTerm"
        static let questionOrComment = "questionOrComment"
    }
    
    
    var firstName : String!
    var lastName : String!
    var emailAddress : String!
    var interestedProgramsOfStudy : NSMutableArray!
    var interestedMajorsOfStudy : String!
    var expectedStartTerm : String!
    var questionOrComment : String!
    
    
    
    init?(newFirstName: String,
          newLastName : String,
          newEmailAddress : String,
          newInterestedProgramsOfStudy : NSMutableArray,
          newInterestedMajorsOfStudy : String,
          newExpectedStartTerm : String,
          newQuestionOrComment : String)
    {
        self.firstName = newFirstName
        self.lastName = newLastName
        self.emailAddress = newEmailAddress
        self.interestedProgramsOfStudy = newInterestedProgramsOfStudy
        self.interestedMajorsOfStudy = newInterestedMajorsOfStudy
        self.expectedStartTerm = newExpectedStartTerm
        self.questionOrComment = newQuestionOrComment
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: DataEntryKey.firstNameKey)
        aCoder.encodeObject(lastName, forKey: DataEntryKey.lastNameKey)
        aCoder.encodeObject(emailAddress, forKey: DataEntryKey.emailAddress)
        aCoder.encodeObject(interestedProgramsOfStudy, forKey: DataEntryKey.interestedProgramsOfStudy)
        aCoder.encodeObject(interestedMajorsOfStudy, forKey: DataEntryKey.interestedMajorsOfStudy)
        aCoder.encodeObject(expectedStartTerm, forKey: DataEntryKey.expectedStartTerm)
        aCoder.encodeObject(questionOrComment, forKey: DataEntryKey.questionOrComment)
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        let firstName = aDecoder.decodeObjectForKey(DataEntryKey.firstNameKey) as! String
        let lastName = aDecoder.decodeObjectForKey(DataEntryKey.lastNameKey) as! String
        let emailAddress = aDecoder.decodeObjectForKey(DataEntryKey.emailAddress) as! String
        
        let interestedProgramsOfStudy = aDecoder.decodeObjectForKey(DataEntryKey.interestedProgramsOfStudy) as! NSMutableArray
        let interestedMajorsOfStudy = aDecoder.decodeObjectForKey(DataEntryKey.interestedMajorsOfStudy) as! String
        let expectedStartTerm = aDecoder.decodeObjectForKey(DataEntryKey.expectedStartTerm) as! String
        let questionOrComment = aDecoder.decodeObjectForKey(DataEntryKey.questionOrComment) as! String
        
        self.init(newFirstName: firstName,
                  newLastName : lastName,
                  newEmailAddress: emailAddress,
                  newInterestedProgramsOfStudy: interestedProgramsOfStudy,
                  newInterestedMajorsOfStudy:   interestedMajorsOfStudy,
                  newExpectedStartTerm: expectedStartTerm,
                  newQuestionOrComment: questionOrComment)
    }
    
}
