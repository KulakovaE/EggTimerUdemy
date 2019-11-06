//
//  ViewController.swift
//  EggTimerUdemy
//
//  Created by Darko Kulakov on 2019-11-06.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        print(sender.currentTitle)
    }

}

