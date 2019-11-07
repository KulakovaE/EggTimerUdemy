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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
    }
    
    let eggTime =  [
                    "SOFT EGG" : 3,
                    "MEDIUM EGG" : 4,
                    "HARD EGG" : 7
                    ]
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
//        let tag = sender.tag
//        switch tag {
//        case 0:
//            showAlert(title: "SOFT", message: "You have clicked soft egg")
//        case 1:
//        showAlert(title: "MEDIUM", message: "You have clicked medium egg")
//        case 2:
//        showAlert(title: "HARD", message: "You have clicked hard egg")
//        default:
//           print("Error")
//        }
       
        
        progressView.progress = 0.0
        secondsPassed = 0//use this when you do not have how to inform the user that has clicked on another btn so the timer will start from 0 if you change the btn
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
            //secondsPassed = 0//use this if you want to continue to count with the timer when you are clicking on another btn
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

