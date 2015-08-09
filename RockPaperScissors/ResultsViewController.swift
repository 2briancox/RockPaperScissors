//
//  ResultsViewController.swift
//  RockPaperScissors
//
//  Created by Brian on 8/1/15.
//  Copyright (c) 2015 Rainien.com, LLC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var imageResult: UIImageView!
    
    var im: UIImage = UIImage()
    
    var message: String = ""
    
    var compChoice = 0

    var playChoice = 0
    
    var allResults: [[Int]] = [[]]
    
    @IBOutlet weak var compImage: UIImageView!
    @IBOutlet weak var playImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = message
        
        imageResult.image = im
        
        switch (compChoice) {
            case 1: compImage.image = UIImage(named: "rock")
            case 2: compImage.image = UIImage(named: "paper")
            case 3: compImage.image = UIImage(named: "scissors")
            default: println("no compImage")
        }
        
        switch (playChoice) {
            case 1: playImage.image = UIImage(named: "rock")
            case 2: playImage.image = UIImage(named: "paper")
            case 3: playImage.image = UIImage(named: "scissors")
            default: println("no playImage")
        }
    }

    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resultsListPressed(sender: UIButton) {
        
        performSegueWithIdentifier("showList", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! ResultsListViewController
        
        vc.allResults = self.allResults

    }
    

}
