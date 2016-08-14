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
    
    //Picker View
    @IBOutlet var startTermPickerView: UIPickerView!
    let pickerViewData = ["Spring 2017", "Summer 2017", "Fall 2017",
                          "Spring 2018", "Summer 2018", "Fall 2018", "Other"]
    
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
        //  programsOfStudyLabel.lineBreakMode = .ByWordWrapping;
        //  programsOfStudyLabel.numberOfLines = 0;
        startTermPickerView.dataSource = self;
        startTermPickerView.delegate = self;
        
        //Looks for single or multiple taps in view
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        intensiveEnglishCheckbox.setImage(UIImage(named: "uncheckedbox.png"), forState: .Normal)
        intensiveEnglishCheckbox.setImage(UIImage(named: "checkedbox.png"), forState: .Selected)
        
    
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



}

