//
//  ViewController.swift
//  CSUF-Student-Form
//
//  Created by Bruno Venegas on 8/11/16.
//  Copyright © 2016 California State University, Fullerton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello, world!");
        
        Model.setDummyData()
        Model.loadDummyData()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

