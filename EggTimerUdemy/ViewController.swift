//
//  ViewController.swift
//  EggTimerUdemy
//
//  Created by Darko Kulakov on 2019-11-06.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var timer = Timer()
    var audioPlayer: AVAudioPlayer!
    
    let eggTime =  [
                    "SOFT EGG" : 300,
                    "MEDIUM EGG" : 420,
                    "HARD EGG" : 720
                    ]
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressView.progress = 0.0
        secondsPassed = 0
        timerLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            timerLabel.text = "DONE!"
            theEggIsDone(soundName: "alarm_sound")
        }
    }
    
    func theEggIsDone(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
               audioPlayer = try! AVAudioPlayer(contentsOf: url!)
               audioPlayer?.play()
    }
    
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

