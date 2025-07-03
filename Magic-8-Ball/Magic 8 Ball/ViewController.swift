//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImage: UIImageView!
    
    @IBOutlet weak var questionText: UILabel!
    
    let ballArray = [UIImage(imageLiteralResourceName: "ball1"), UIImage(imageLiteralResourceName: "ball2"),UIImage(imageLiteralResourceName: "ball3"),UIImage(imageLiteralResourceName: "ball4"),UIImage(imageLiteralResourceName: "ball5")]
    
    let questionArray = ["Can I watch movie Today?", "Can I eat Pizza Today?", "Can I play cricket Today?","Should I go to meet my relatives?", "Should I have to make dinner tonight?"]

    @IBAction func askButton(_ sender: UIButton) {
        ballImage.image = ballArray.randomElement()
        print("Ask Button Clicked")
    }
    
    @IBAction func changeQuuestionText(_ sender: UIButton) {
        questionText.text = questionArray.randomElement()
        print("Change Button Clicked")
    }
}

