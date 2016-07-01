//
//  MathViewController.swift
//  Crazy Math
//
//  Created by user on 08.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {

    @IBOutlet weak var problemLabel: UILabel!
    
    @IBOutlet weak var solutionTextField: UITextField!
    
    var rightNumber: Int!
    var leftNumber: Int!
    
    var delegate: MathScoreDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateProblem()

    }

    @IBAction func submitButton(sender: UIButton) {
        guard let answer = Int(solutionTextField.text!) else {
            alertController("No answer!", message: "Please enter your answer, before hitting submit, muggle!", isBackButton: false)
            return
        }
        
        var points = 0
        if answer == rightNumber * leftNumber {
            //self.alertController("CORRECT!", message: "CONGRATS! 1 point to Griffindor!", isBackButton: true)
            //here we continue game by generating a problem and clearing text field
            points = points + 1
            solutionTextField.text = ""
            generateProblem()
            
        }else{
            self.alertController("WRONG!", message: "Too bad, -2 points from Slytherin", isBackButton: true)
            points = -2
        }
        delegate.updateScore(points)
    }
    
    func generateProblem(){
        rightNumber = generateRandomNumber()
        leftNumber = generateRandomNumber()
        
        self.problemLabel.text = "\(rightNumber) x \(leftNumber)"
        
    }
    func generateRandomNumber() -> Int {
        return Int(arc4random_uniform(UInt32(9))) + 1
    
    }
    
    func alertController(title: String, message: String, isBackButton: Bool ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        let backButton = UIAlertAction(title: "Try again", style: .Default){ (action: UIAlertAction) in
            self.dismissViewControllerAnimated(true, completion: nil)
        
        }
        
        if isBackButton == true {
            alertController.addAction(backButton)
        }else{
            alertController.addAction(okButton)
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}
