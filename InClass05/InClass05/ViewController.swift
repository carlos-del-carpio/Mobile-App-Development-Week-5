//
//  ViewController.swift
//  InClass05
//
//  Created by Carlos Del Carpio on 10/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var categoriesTable: UITableView!
    var categories : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCatgories()
    }
    
    
    func getCatgories () {
        for category in AppsData.data.keys {
            categories.append(category)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTable.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = categoriesTable.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "fromCategoriesToApps", sender: cell)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = sender as! UITableViewCell
        let destinationVC = segue.destination as! AppsViewController
        destinationVC.navigationItem.title = sender.textLabel?.text
    }
}
