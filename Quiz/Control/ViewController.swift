//
//  ViewController.swift
//  Quiz
//
//  Created by Vishnu Priyan on 13/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var progressiveBar: UIProgressView!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //when any button pressed
    @IBAction func pressed(_ sender: UIButton) {
        
        if quiz.checkAns(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quiz.counter()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self , selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    //
    @objc func updateUI(){
        questionLabel.text = quiz.updateQues()
        scoreLabel.text = "Score \(quiz.updateScore())"
        option1.setTitle(quiz.updateOption()[0], for: .normal)
        option2.setTitle(quiz.updateOption()[1], for: .normal)
        option3.setTitle(quiz.updateOption()[2], for: .normal)
        progressiveBar.progress = quiz.progress()
        
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
    }
    
}

