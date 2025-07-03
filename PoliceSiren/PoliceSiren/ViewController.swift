//
//  ViewController.swift
//  PoliceSiren
//
//  Created by Macbook on 02/07/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueview: UIView!
        
    private var isRedOn = true
    private var timer: Timer?
    private var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = 1.0
        blueview.alpha = 0.2

        playSound()
        startSirenEffect()
    }
    
    private func playSound() {
        guard let path = Bundle.main.path(forResource: "sound", ofType:"mp3") else {
            print("Sound file not found")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1  // 🔁 loop sound forever
            player.play()

        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }



    private func startSirenEffect() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.toggleColors()
        }
    }

    private func toggleColors() {
        UIView.animate(withDuration: 0.3) {
            if self.isRedOn {
                self.redView.alpha = 1.0
                self.blueview.alpha = 0.2
            } else {
                self.redView.alpha = 0.2
                self.blueview.alpha = 1.0
            }
        }
        isRedOn.toggle()
    }

    deinit {
        timer?.invalidate()
    }
}
