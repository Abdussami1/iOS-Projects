//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(storyNumber: storyBrain.storyNumber)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        updateUI(storyNumber: storyBrain.nextStory(userChoice: sender.currentTitle!))
    }
    
    func updateUI(storyNumber: Int){
        storyLabel.text = storyBrain.story[storyNumber].title
        choice1Button.setTitle(storyBrain.story[storyNumber].choice1 , for: .normal)
        choice2Button.setTitle(storyBrain.story[storyNumber].choice2, for: .normal)
    }
}

