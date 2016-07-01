//
//  ViewController.swift
//  Crazy Math
//
//  Created by user on 08.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

protocol MathScoreDelegate {
    func updateScore(points: Int)

}

class ViewController: UIViewController, MathScoreDelegate {

    @IBOutlet weak var scoreBoardLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let score = NSUserDefaults.standardUserDefaults().objectForKey("score"){
            scoreBoardLabel.text = "Your score is: \(score as! Int)"
        } else{
            scoreBoardLabel.text = "Welcome to Crazy Mathematician!"
            NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "score")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fightButton(sender: UIButton) {
        
    }
    
    
    @IBAction func extraButton(sender: UIButton) {
        self.performSegueWithIdentifier("SegueGame", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueGame"{
            let mathVC = segue.destinationViewController as! MathViewController
            mathVC.delegate = self
            
        } else if segue.identifier == "SegueFight"{
            let mathVC = segue.destinationViewController as! MathViewController
            mathVC.delegate = self
        
        }
    }
    
    
    func updateScore(points: Int) {
        let currentScore = NSUserDefaults.standardUserDefaults().integerForKey("score") + points
        NSUserDefaults.standardUserDefaults().setInteger(currentScore, forKey: "score")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        scoreBoardLabel.text = "Your score is: \(currentScore)"
        
    
    }

}

