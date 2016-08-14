//
//  ViewController.swift
//  CSUF-Student-Form
//
//  Created by Raymundo Venegas on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Text Fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    
    // Labels
    @IBOutlet weak var programsOfStudyLabel: UILabel!
    @IBOutlet weak var startTermLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeVariables();
       
        Model.setDummyData()
        Model.loadDummyData()
        
        print("Hello, world!");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeVariables() {
      //  programsOfStudyLabel.lineBreakMode = .ByWordWrapping;
     //   programsOfStudyLabel.numberOfLines = 0;
        
    }


}

