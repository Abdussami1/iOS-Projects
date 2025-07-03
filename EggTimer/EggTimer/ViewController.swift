//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium":420, "Hard":720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil   , repeats: true)
//        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            var progress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = progress
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Could not load the sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }


}
