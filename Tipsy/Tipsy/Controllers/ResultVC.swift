//
//  ResultVC.swift
//  Tipsy
//
//  Created by Macbook on 03/07/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var total:String?
    var setting:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsLabel.text = setting
        totalLabel.text = total
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
