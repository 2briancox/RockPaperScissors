//
//  ResultsListViewController.swift
//  RockPaperScissors
//
//  Created by Brian on 8/9/15.
//  Copyright (c) 2015 Rainien.com, LLC. All rights reserved.
//

import UIKit

class ResultsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var allResults: [[Int]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allResults.removeAtIndex(0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ResultsTableViewCell = tableView.dequeueReusableCellWithIdentifier("ResultListCell") as! ResultsTableViewCell
        
        switch (allResults[indexPath.row][0]) {
            case 1: cell.youImage.image = UIImage(named: "rock")
            case 2: cell.youImage.image = UIImage(named: "paper")
            case 3: cell.youImage.image = UIImage(named: "scissors")
            default: println("default youImage")
        }
            
        switch (allResults[indexPath.row][1]) {
            case 1: cell.compImage.image = UIImage(named: "rock")
            case 2: cell.compImage.image = UIImage(named: "paper")
            case 3: cell.compImage.image = UIImage(named: "scissors")
            default: println("default compImage")
        }
            
            switch (allResults[indexPath.row][2]) {
            case -1:
                cell.resultLabel.text = "-"
                cell.resultLabel.textColor = UIColor.redColor()
            case 0:
                cell.resultLabel.text = "0"
                cell.resultLabel.textColor = UIColor.yellowColor()
            case 1:
                cell.resultLabel.text = "+"
                cell.resultLabel.textColor = UIColor.greenColor()
            default: println("default resultLabel")
        }
        
        return cell
    }
    @IBAction func backPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}
