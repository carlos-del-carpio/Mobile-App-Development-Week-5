//
//  AppsViewController.swift
//  InClass05
//
//  Created by Carlos Del Carpio on 10/2/21.
//

import UIKit

class AppsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var appsTableView: UITableView!
    var appNameText : String?
    var developerNameText : String?
    var releaseDateText : String?
    var priceText : String?
    var category : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        category = navigationItem.title!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppsData.data[category]!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appsTableView.dequeueReusableCell(withIdentifier: "appCell", for: indexPath)
        let app = AppsData.data[category]![indexPath.row]
        
        let appTitle = cell.viewWithTag(1) as! UILabel
        let developerName = cell.viewWithTag(2) as! UILabel
        let releaseDate = cell.viewWithTag(3) as! UILabel
        let price = cell.viewWithTag(4) as! UILabel
        
        appNameText = app.title
        developerNameText = app.developer
        releaseDateText = dateFormatting(dateInput: app.releaseDate!)
        priceText = app.price
        
        appTitle.text = app.title
        developerName.text = app.developer
        releaseDate.text = dateFormatting(dateInput: app.releaseDate!)
        price.text = app.price
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = appsTableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "fromAppsToAppDetails", sender: cell)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as! AppDetailViewController
        let sender = sender as! UITableViewCell
        
        let ipath = self.appsTableView.indexPath(for: sender)
        let app1 = AppsData.data[category]![ipath!.row]
    
        destinationVC.app = app1
    }
}

extension UIViewController {
    func dateFormatting(dateInput : String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, yyyy"

        let date: NSDate? = dateFormatterGet.date(from: dateInput) as NSDate?
        
        
        return dateFormatterPrint.string(from: date! as Date)
    }
}
