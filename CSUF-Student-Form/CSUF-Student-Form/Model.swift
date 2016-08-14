//
//  Model.swift
//  CSUF-Student-Form
//
//  Created by Charlie Buckets on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import Foundation

class Model : NSObject {
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("dataEntries")
    
    static private var dataEntryList: [DataEntry] = []
    
    static func saveDataEntries()-> Bool{
        return NSKeyedArchiver.archiveRootObject(dataEntryList, toFile: ArchiveURL.path!)
    }
    
    static func loadDataEntries(){
        if let array = (NSKeyedUnarchiver.unarchiveObjectWithFile(ArchiveURL.path!) as? [DataEntry]){
            dataEntryList = array
        }
        
        let tempEntry = dataEntryList[0] as DataEntry
    }
    
    static func setDummyData(){
        let programs = NSMutableArray(array: ["Intensive English Program",
            "Undergraduate",
            "Graduate",
            "Summer Program",
            "Other"])
        
        let newData = DataEntry(newFirstName: "Hafthor",
                                newLastName: "Bjornnson",
                                newEmailAddress: "Hafthor@valhalla.org",
                                newInterestedProgramsOfStudy: programs,
                                newInterestedMajorsOfStudy: "Weightlifting",
                                newExpectedStartTerm: "Sprint 2017",
                                newQuestionOrComment: "Will the desks be accomodating to my large frame?")
        dataEntryList.append(newData!)
        self.saveDataEntries()
    }
    
    static func loadDummyData(){
        self.loadDataEntries()
    }
    
    
}