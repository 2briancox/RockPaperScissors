//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Brian on 7/31/15.
//  Copyright (c) 2015 Rainien.com, LLC. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    var youWin: Int = 0
    
    var playerChoice: Int = 0
    
    var computerChoice: Int = 0
    
    var resultImage: UIImage? = nil
    
    var gamesPlayed = 0
    var gamesWon = 0
    var gamesTied = 0
    var gamesLost = 0
    
    var allResults: [[Int]] = [[]]
    
    
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var gamesTiedLabel: UILabel!
    @IBOutlet weak var gamesLostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rockButton(sender: UIButton) {
        gamesPlayed++
        playerChoice = 1
        evaluateWinner()
    }
    
    
    @IBAction func paperButton(sender: UIButton) {
        gamesPlayed++
        playerChoice = 2
        evaluateWinner()
    }
    
    @IBAction func scissorsButton(sender: UIButton) {
        gamesPlayed++
        playerChoice = 3
        evaluateWinner()
    }
    
    func evaluateWinner () {
        computerChoice = Int(arc4random_uniform(UInt32(3))) + 1
        
        if playerChoice == 1 {   // Player: rock
            if computerChoice == 1 {   //comp: rock
                youWin = 0
                gamesTied++
                resultImage = UIImage(named: "Handshake")!
            }  else if computerChoice == 2 {   //comp: paper
                youWin = -1
                gamesLost++
                resultImage = UIImage(named: "PaperCoversRock")!
            }   else {      //comp: scissors
                youWin = 1
                gamesWon++
                resultImage = UIImage(named: "RockCrushesScissors")!
            }
        } else if playerChoice == 2 {  //Player: paper
            if computerChoice == 1 {   //comp: rock
                youWin = 1
                gamesWon++
                resultImage = UIImage(named: "PaperCoversRock")!
            }  else if computerChoice == 2 {   //comp: paper
                youWin = 0
                gamesTied++
                resultImage = UIImage(named: "Handshake")!
            }   else {      //comp: scissors
                youWin = -1
                gamesLost++
                resultImage = UIImage(named: "ScissorsCutPaper")!
            }
        } else {    //Player: scissors
            if computerChoice == 1 {   //comp: rock
                youWin = -1
                gamesLost++
                resultImage = UIImage(named: "RockCrushesScissors")!
            }  else if computerChoice == 2 {   //comp: paper
                youWin = 1
                gamesWon++
                resultImage = UIImage(named: "ScissorsCutPaper")!
            }   else {      //comp: scissors
                youWin = 0
                gamesTied++
                resultImage = UIImage(named: "Handshake")!
            }
        }
        
        let tempResult = [playerChoice, computerChoice, youWin]
        
        allResults.append(tempResult)
        
        self.gamesPlayedLabel.text? = "\(gamesPlayed)"
        gamesWonLabel.text? = "\(gamesWon)"
        gamesTiedLabel.text? = "\(gamesTied)"
        gamesLostLabel.text? = "\(gamesLost)"
        
        self.performSegueWithIdentifier("segueToResults", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! ResultsViewController
        
        if youWin == 1 {
            vc.message = "YOU WIN!"
        } else if youWin == 0 {
            vc.message = "TIE GAME!"
        } else {
            vc.message = "YOU LOSE!"
        }
        
        vc.playChoice = playerChoice
        vc.compChoice = computerChoice
        
        vc.allResults = self.allResults
        
        println("Player Choice: \(playerChoice)")
        println("Computer Choice: \(computerChoice)")
        println(youWin)
        
        vc.im = self.resultImage!
    }
}

