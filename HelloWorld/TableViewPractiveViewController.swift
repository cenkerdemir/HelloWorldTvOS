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
    
    @IBOutlet weak var weatherSummary: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    let dataArray = ["San Francisco", "San Diego", "Los Angeles", "San Jose", "Mountain View", "Sacramento"]
    let subtitles = ["Cisco", "Diegos", "The Angles", "Joses", "The Mountain", "The Capital"]
    let cityImages = ["San-Francisco.jpg", "San-Diego.jpg", "Los-Angeles.jpg", "San-Jose.jpg", "Mountain-View.jpg", "Sacramento.jpg"]
    let cityCoordinates = ["/37.773972,-122.431297","/32.715736,-117.161087","/34.052235,-118.243683","/37.279518,-121.867905","/37.386051,-122.083855","/38.575764,-121.478851"]
    
    var cityWeatherSummaries : [String] = ["","","","","",""]
    var cityTemperatures : [String] = ["","","","","",""]
    
    let darkSkyFullUrlString = darkskyApiUrlString + forecastAPIKey
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.filloutTemperatureAndSummary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - helper functions
    
    func filloutTemperatureAndSummary() {
        
        for city in self.cityCoordinates {
            guard let index = self.cityCoordinates.index(of: city) else {return}
            getWeatherInfo(for: city, index: index)
        }
        
    }
    
    func getWeatherInfo(for LatLongStr: String, index: Int){
        let requestUrlString = self.darkSkyFullUrlString + LatLongStr
        if let url = NSURL(string: requestUrlString) {
            if let data = NSData(contentsOf: url as URL){
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    let newDict = parsed as? NSDictionary
                    let currentSumDict = newDict!["currently"] as? NSDictionary
                    cityWeatherSummaries[index] =  "\(currentSumDict!["summary"]!)"
                    cityTemperatures[index] = "\(currentSumDict!["temperature"]!)"
                }
                catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
                }
            }
        }
        
    }

    
    //MARK - tableview functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let indexPath = context.nextFocusedIndexPath else {return}
        self.cityImage.image = UIImage(named: self.cityImages[indexPath.row])
        
        self.weatherSummary.text = cityWeatherSummaries[indexPath.row]
        self.temperature.text = cityTemperatures[indexPath.row]
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
