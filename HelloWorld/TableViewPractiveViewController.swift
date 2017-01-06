//
//  TableViewPractiveViewController.swift
//  HelloWorld
//
//  Created by Cenker Demir on 1/6/17.
//  Copyright © 2017 Cenker Demir. All rights reserved.
//

import UIKit

class TableViewPractiveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cityImage: UIImageView!
    
    let dataArray = ["San Francisco", "San Diego", "Los Angeles", "San Jose", "Mountain View", "Sacramento"]
    let subtitles = ["Cisco", "Diegos", "The Angles", "Joses", "The Mountain", "The Capital"]
    let cityImages = ["San-Francisco.jpg", "San-Diego.jpg", "Los-Angeles.jpg", "San-Jose.jpg", "Mountain-View.jpg", "Sacramento.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let indexPath = context.nextFocusedIndexPath else {return}
        self.cityImage.image = UIImage(named: self.cityImages[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cityCellReuseIdentifier")
        
        cell.textLabel?.text = self.dataArray[indexPath.row]
        cell.detailTextLabel?.text = "Hello from \(self.subtitles[indexPath.row])"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
