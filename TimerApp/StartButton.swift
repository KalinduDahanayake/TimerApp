//
//  StartButton.swift
//  TimerApp
//
//  Created by Kalindu Dahanyake on 9/9/21.
//

import UIKit

class StartButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        self.layer.borderWidth = 1
    }

}
