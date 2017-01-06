//
//  QuizViewController.swift
//  HelloWorld
//
//  Created by Cenker Demir on 1/6/17.
//  Copyright © 2017 Cenker Demir. All rights reserved.
//

import UIKit

class QuizViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func didTapIstanbul(_ sender: UIButton) {
        self.showAlertToUser(title: "Wrong Answer", message: "You got it wrong")
    }
    
    
    @IBAction func didTapIzmir(_ sender: UIButton) {
        self.showAlertToUser(title: "Wrong Answer", message: "You got it wrong")
    }
 
    @IBAction func didTapAnkara(_ sender: UIButton) {
        self.showAlertToUser(title: "Write Answer!", message: "Congratulations!!!")
    }
    
    @IBAction func didTapAdana(_ sender: UIButton) {
        self.showAlertToUser(title: "Wrong Answer", message: "You got it wrong")
    }

    func showAlertToUser(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) {
        }
    }

}
