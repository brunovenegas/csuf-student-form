//
//  ViewController.swift
//  CSUF-Student-Form
//
//  Created by Raymundo Venegas on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import UIKit

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
    
    // Picker View
    @IBOutlet var startTermPickerView: UIPickerView!
    let pickerViewData = ["Spring 2017", "Summer 2017", "Fall 2017",
                          "Spring 2018", "Summer 2018", "Fall 2018", "Later"]
    var selectedTermString: String = ""
    
    // Resources
    let checkedImage = UIImage(named: "checkedbox")! as UIImage
    let uncheckedImage = UIImage(named: "uncheckedbox")! as UIImage
    
    // Data Entry
    var newDataEntry: [DataEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        initializeVariables();
       
    //    Model.setDummyData()
    //    Model.loadDummyData()
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
                intensiveEnglishCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(englishBool == false) {
                englishBool = true
                intensiveEnglishCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == undergraduateCheckbox) {
            if(undergradBool == true) {
                undergradBool = false
                undergraduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(undergradBool == false) {
                undergradBool = true
                undergraduateCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == graduateCheckbox) {
            if(graduateBool == true) {
                graduateBool = false
                graduateCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(graduateBool == false) {
                graduateBool = true
                graduateCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == summerProgramCheckbox) {
            if(summerBool == true) {
                summerBool = false
                summerProgramCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(summerBool == false) {
                summerBool = true
                summerProgramCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == otherCheckbox) {
            if(otherBool == true) {
                otherBool = false
                otherCheckbox.setImage(uncheckedImage, forState: UIControlState.Normal)
            }
            else if(otherBool == false) {
                otherBool = true
                otherCheckbox.setImage(checkedImage, forState: UIControlState.Normal)
            }
        }
        else if(sender == saveButton) {
            // Save all data and clear everything
        //    newDataEntry.append(<#T##newElement: Element##Element#>)
            print(firstNameTextField.text)
            print(lastNameTextField.text)
            print(emailTextField.text)
            print(summerBool.boolValue)
            print(undergradBool.boolValue)
            print(graduateBool.boolValue)
            print(summerBool.boolValue)
            print(otherBool.boolValue)
            print(majorTextField.text)
            print(selectedTermString)
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



}

