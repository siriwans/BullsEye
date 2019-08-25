//
//  ViewController.swift
//  BullsEye
//
//  Created by Siriwan Sereesathien on 8/12/18.
//  Copyright © 2018 Siriwan Sereesathien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    //not sure what this is for like IB stuff
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rounded = slider.value.rounded()
        currentValue = Int(rounded)
        startNewGame()
        // Do any additional setup after loading the view, typically from a nib.
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "green")
        _ = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        var difference: Int
        difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
            
        }
        else if difference == 1{
            title = "Pretty Good!"
            points += 50
        }
        else if difference < 5{
            title = "You almost had it!"
        }
        else if difference < 10{
            title = "Pretty Good!"
        }
        
        else{
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
            //"The value of the slider is now: \(currentValue)" + "\n The target value is: \(targe tValue)" + "\nThe difference is: \(difference)"
        //title message and style (idk what style is) of the pop up info retangle
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //the touchable part of the message that we could select
        let action = UIAlertAction(title: "OK", style: .default, handler: {
        action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("The value of the slider is now \(slider.value)")
        let rounded = slider.value.rounded()
        currentValue = Int(rounded)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

}

