//
//  ViewController.swift
//  Egg-Timer-Application-NES
//
//  Created by Nathaniel Spry on 11/3/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var eggTimes = ["Soft": 4,"Medium": 7,"Hard": 10]
    
    var startTime = 0
    var totalTime = 0
    
    var timer = Timer()
    
    @IBAction func clickMe(_ sender: UIButton) {
        
        timer.invalidate()
        progressView.progress = 0.0
        startTime = 0
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
    
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        
        if startTime < totalTime {
            
            startTime += 1
            progressView.progress = Float(startTime)/Float(totalTime)

        }
        
        else {
            
            outputLabel.text = "Eggs are ready!"
            timer.invalidate()
            
        }
    }

}
