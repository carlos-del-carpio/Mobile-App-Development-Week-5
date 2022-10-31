//
//  AppDetailViewController.swift
//  InClass05
//
//  Created by Carlos Del Carpio on 10/7/21.
//

import UIKit

class AppDetailViewController: UIViewController {
    @IBOutlet weak var appTitleOutput: UILabel!
    @IBOutlet weak var developerNameOutput: UILabel!
    @IBOutlet weak var releaseDateOutput: UILabel!
    @IBOutlet weak var priceOutput: UILabel!
    
    var app: App?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitleOutput.text = app?.title
        developerNameOutput.text = app?.developer
        releaseDateOutput.text = dateFormatting(dateInput: app!.releaseDate!)
        priceOutput.text = app?.price
    }
}
