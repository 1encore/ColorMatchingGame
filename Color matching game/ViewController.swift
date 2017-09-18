//
//  ViewController.swift
//  Color matching game
//
//  Created by Yerbolat Beisenbek on 11.09.17.
//  Copyright © 2017 Yerbolat Beisenbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    let colorArray = [UIColor.blue, UIColor.gray, UIColor.yellow, UIColor.red, UIColor.green]
    let textColor = ["blue","gray", "yellow", "red", "green"]
    
    var textIndex: Int!
    var colorIndex: Int!
    var timer: Timer!
    
    var score: Int = 0
    var answer: Bool = false
    var timeLeft = 5
    
    @objc func updateCounting(){
        timeLeft -= 1
        timerLabel.text = String(timeLeft)
        if timeLeft == 0 {
            showQuestion()
        }
    }
    
    func updateTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounting), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        self.updateTimer()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func returnRandomNumber() -> Int{
        let random = Int(arc4random_uniform(UInt32(colorArray.count)))
        
        return random
    }
    
    func showQuestion(){
        timeLeft = 5
        textIndex = returnRandomNumber()
        colorIndex = returnRandomNumber()
        
        if textIndex == colorIndex { answer = true }
        else { answer = false }
        
        textLabel.text = textColor[textIndex]
        textLabel.backgroundColor = colorArray[colorIndex]
    }


    @IBAction func yesButtonClicked(_ sender: UIButton) {
        if answer {
            score = score + 100
            scoreLabel.text = String(score)
        }
        showQuestion()
    }
    
    @IBAction func noButtonClicked(_ sender: UIButton) {
        if !answer {
            score = score + 100
            scoreLabel.text = String(score)
        }
        showQuestion()
    }

}

