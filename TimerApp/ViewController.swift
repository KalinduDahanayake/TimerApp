//
//  ViewController.swift
//  TimerApp
//
//  Created by Kalindu Dahanyake on 9/9/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!	
    var timer:Timer = Timer()
    var currentTime: Int = 0
    var startTime: Int = 0
    var stopped: Bool = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = secondsToHoursMinutesSeconds(seconds: currentTime)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StartStopPress(_ sender: Any) {
        // Start
        if (stopped) {
            self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
            stopped = !stopped
        }
        
        // Stop
        else {
            self.view.backgroundColor = #colorLiteral(red: 0.9952777028, green: 0.3051763177, blue: 0.4160037041, alpha: 1)
            stopped = !stopped
            timer.invalidate()
        }
    }
    
    @objc func step() {
        if currentTime > 0 {
            currentTime -= 1
        } else {
            timer.invalidate()
            currentTime = startTime
            self.view.backgroundColor = #colorLiteral(red: 0.9952777028, green: 0.3051763177, blue: 0.4160037041, alpha: 1)
            stopped = true
        }
        
        timeLabel.text = secondsToHoursMinutesSeconds(seconds: currentTime)
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (String) {
        var timeString = ""
        timeString += String(format: "%02d", (seconds % 3600) / 60)
        timeString += " : "
        timeString += String(format: "%02d", (seconds % 3600) % 60)
        return timeString
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        timeLabel.text = secondsToHoursMinutesSeconds(seconds: startTime)
        self.view.backgroundColor = #colorLiteral(red: 0.9952777028, green: 0.3051763177, blue: 0.4160037041, alpha: 1)
        stopped = !stopped
    }
    
    @IBAction func increaseTime(_ sender: UIButton) {
        switch sender.tag{
            case 0:
                currentTime += 1
            case 1:
                currentTime += 5
            case 2:
                currentTime += 10
            case 3:
                currentTime += 30
            default:
                currentTime += 0
        }
        startTime = currentTime
        timeLabel.text = secondsToHoursMinutesSeconds(seconds: currentTime)
        
    }
    
    @IBAction func decreaseTime(_ sender: UIButton) {
        switch sender.tag{
            case 0:
                currentTime -= 1
            case 1:
                currentTime -= 5
            case 2:
                currentTime -= 10
            case 3:
                currentTime -= 30
            default:
                currentTime -= 0
        }
        
        if (currentTime < 0) {
            currentTime = 0
        }
        startTime = currentTime
        timeLabel.text = secondsToHoursMinutesSeconds(seconds: currentTime)
    }
    
    
}

