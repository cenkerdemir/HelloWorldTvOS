//
//  ViewController.swift
//  HelloWorld
//
//  Created by Cenker Demir on 1/6/17.
//  Copyright © 2017 Cenker Demir. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        guard let helloText = helloWorldLabel.text else {return}
        switch helloText {
        case "Hello Cenker":
            helloWorldLabel.text = "Hello World"
        default:
            helloWorldLabel.text = "Hello Cenker"
        }
    }
    

}

