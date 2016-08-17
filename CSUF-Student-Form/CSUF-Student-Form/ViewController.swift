//
//  ViewController.swift
//  CSUF-Student-Form
//
//  Created by Raymundo Venegas on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Text Fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    
    // Labels
    @IBOutlet weak var programsOfStudyLabel: UILabel!
    @IBOutlet weak var startTermLabel: UILabel!

    // Checkboxes and Buttons
    @IBOutlet var intensiveEnglishCheckbox: UIButton!
    @IBOutlet var undergraduateCheckbox: UIButton!
    @IBOutlet var graduateCheckbox: UIButton!
    @IBOutlet var summerProgramCheckbox: UIButton!
    @IBOutlet var otherCheckbox: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    // Checkbox booleans
    var englishBool: Bool = false
    var undergradBool: Bool = false
    var graduateBool: Bool = false
    var summerBool: Bool = false
    var otherBool: Bool = false
    var englishString: String = "No"
    var undergradString: String = "No"
    var graduateString: String = "No"
    var summerString: String = "No"
    var otherString: String = "No"
    var summerProgramArray: NSMutableArray = []
    
    // Picker View
    @IBOutlet var startTermPickerView: UIPickerView!
    let pickerViewData = ["Spring 2017", "Summer 2017", "Fall 2017",
                          "Spring 2018", "Summer 2018", "Fall 2018", "Later"]
    var selectedTermString: String = ""
    
    // Resources
    let checkedImage = UIImage(named: "checkedbox")! as UIImage
    let uncheckedImage = UIImage(named: "uncheckedbox")! as UIImage
    
    // CSV Stuff
    let csvHeaderString: String = "FirstName,LastName,Email,IntensiveEnglish,Undergrad,Graduate,Summer,Other,Major,StartTerm\n"
    var userDataString: String = ""
    var didFilePreviouslyExist: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        initializeVariables();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeVariables() {
        startTermPickerView.dataSource = self;
        startTermPickerView.delegate = self;
        
        // Display e-mail friendly keyboard
        emailTextField.keyboardType = UIKeyboardType.EmailAddress
        
        // Remove autocorrection on text fields
        firstNameTextField.autocorrectionType = .No
        lastNameTextField.autocorrectionType = .No
        emailTextField.autocorrectionType = .No
        majorTextField.autocorrectionType = .No
        
        
        //Looks for single or multiple taps in view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Button/Checkbox targets
        setButtonTargets()
    
    }
    
    func setButtonTargets() {
        intensiveEnglishCheckbox.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        undergraduateCheckbox.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        graduateCheckbox.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        summerProgramCheckbox.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        otherCheckbox.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        saveButton.addTarget(self, action: #selector(ViewController.checkboxPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func checkboxPressed(sender: UIButton!) {
        
        if(sender == intensiveEnglishCheckbox) {
            if(englishBool == true) {
                englishBool = false
                englishString = "No"
                intensiveEnglishCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(englishBool == false) {
                englishBool = true
                englishString = "Yes"
                intensiveEnglishCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == undergraduateCheckbox) {
            if(undergradBool == true) {
                undergradBool = false
                undergradString = "No"
                undergraduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(undergradBool == false) {
                undergradBool = true
                undergradString = "Yes"
                undergraduateCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == graduateCheckbox) {
            if(graduateBool == true) {
                graduateBool = false
                graduateString = "No"
                graduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(graduateBool == false) {
                graduateBool = true
                graduateString = "Yes"
                graduateCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == summerProgramCheckbox) {
            if(summerBool == true) {
                summerBool = false
                summerString = "No"
                summerProgramCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(summerBool == false) {
                summerBool = true
                summerString = "Yes"
                summerProgramCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == otherCheckbox) {
            if(otherBool == true) {
                otherBool = false
                otherString = "No"
                otherCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(otherBool == false) {
                otherBool = true
                otherString = "Yes"
                otherCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == saveButton) {
            userDataString = String(format: "\(firstNameTextField.text!),\(lastNameTextField.text!),\(emailTextField.text!),\(englishString),\(undergradString),\(graduateString),\(summerString),\(otherString),\(majorTextField.text!),\(selectedTermString)\n")
            
            saveInfo(userDataString)
            resetUI()
            retrieveInfo()
        }
        else {
            print("WTF are we doing in here?")
            print("I'm tiny Rick, I don't give a fuck!")
        }
    }
    
    // dismissKeyboard called after tap
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    //
    //UIPickerView Delegate and Data Initialization
    //
    
    // Columns in picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Rows in picker view
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    // Data
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    // Selected Row
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTermString = pickerViewData[row]
    }
    
    // Save CSV info
    func saveInfo(userString: String) {
        let DocumentsDirectory: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let ArchiveURL: String = DocumentsDirectory.stringByAppendingString("/studentinfo.csv")
        if(!NSFileManager.defaultManager().fileExistsAtPath(ArchiveURL)) {
            NSFileManager.defaultManager().createFileAtPath(ArchiveURL, contents: nil, attributes: nil)
            didFilePreviouslyExist = false;
        }
        let fileHandle = NSFileHandle(forUpdatingAtPath: ArchiveURL)
        fileHandle!.seekToEndOfFile()
        if(!didFilePreviouslyExist) {
            fileHandle!.writeData(csvHeaderString.dataUsingEncoding(NSUTF8StringEncoding)!)
        }
        fileHandle!.writeData(userString.dataUsingEncoding(NSUTF8StringEncoding)!)
        fileHandle!.closeFile()
    }
    
    // Retreive CSV info
    func retrieveInfo() {
        let DocumentsDirectory: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let ArchiveURL: String = DocumentsDirectory.stringByAppendingString("/studentinfo.csv")
        if(NSFileManager.defaultManager().fileExistsAtPath(ArchiveURL)) {
            let fileHandle  = NSFileHandle(forReadingAtPath: ArchiveURL)
            let results: String = String(data: fileHandle!.availableData, encoding: NSUTF8StringEncoding)!
            fileHandle?.closeFile()
            print(results)
        }
    }
    
    // Clears text boxes, resets booleans, clears checkboxes
    func resetUI() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        majorTextField.text = ""
        englishBool = false;
        undergradBool = false;
        graduateBool = false;
        summerBool = false;
        otherBool = false;
        intensiveEnglishCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
        undergraduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
        graduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
        summerProgramCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
        otherCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
    }


}

