//
//  PlayViewController.swift
//  TicTacToeBetterEdition
//
//  Created by Sally Cheng on 3/4/16.
//  Copyright © 2016 Gatsby. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // creates board of 3x3, values initialized to 0
    var board = [Int](count: 9, repeatedValue: 0)
    
    // sets to player 1. player 2 value is -1, multiply by -1 to switch states
    var player = 1
    // winner is no one (0) until changed
    var winner = 0
    // turn indicates which turn players are on
    var turn = 1
    
    
    // MARK: Game Functions
    
    // existsWinner() will check for wins and report true if there's a winner
    func existsWinner() -> Bool {
        // diagonal wins
        if (board[0] != 0 && board[0] == board[8] && board[0] == board[4]) {
            winner = board[0]
            return true
        }
        else if (board[2] == board[4] && board[2] == board[6] && board[2] != 0) {
            winner = board[2]
            return true
        }
        else {
            // horizontal wins
            for i in 0...2 {
                if (board[3*i] == board[3*i+1] && board[3*i] == board[3*i+2] && board[3*i] != 0) {
                    winner = board[3*i]
                    return true
                }
            }
            // vertical wins
            for i in 0...2 {
                if (board[i] == board[i+3] && board[i] == board[i+6] && board[i] != 0) {
                    winner = board[i]
                    return true
                }
            }
        }
        return false
    }
    
    func reload(action: UIAlertAction! = nil){
        self.viewDidLoad()
        // resets player to player 1
        player = 1
        turn = 1
        
        for i in 0...8 {
            board[i] = 0
        }
        
        // my eyes bleed please fix this horrid copypasta sorry this is in a bad state right now
        self.button0.setImage(UIImage(named: "0.png")!, forState: .Normal)
        self.button1.setImage(UIImage(named: "1.png")!, forState: .Normal)
        self.button2.setImage(UIImage(named: "2.png")!, forState: .Normal)
        self.button3.setImage(UIImage(named: "3.png")!, forState: .Normal)
        self.button4.setImage(UIImage(named: "4.png")!, forState: .Normal)
        self.button5.setImage(UIImage(named: "5.png")!, forState: .Normal)
        self.button6.setImage(UIImage(named: "6.png")!, forState: .Normal)
        self.button7.setImage(UIImage(named: "7.png")!, forState: .Normal)
        self.button8.setImage(UIImage(named: "8.png")!, forState: .Normal)
        
        button0.userInteractionEnabled = true
        button1.userInteractionEnabled = true
        button2.userInteractionEnabled = true
        button3.userInteractionEnabled = true
        button4.userInteractionEnabled = true
        button5.userInteractionEnabled = true
        button6.userInteractionEnabled = true
        button7.userInteractionEnabled = true
        button8.userInteractionEnabled = true
        
    }
    
    func displayWinner() {
        var title: String
        if (winner == 1) {
            title = "Player 1 wins!"
        }
        else {
            title = "Player 2 wins!"
        }
        
        let winAlert = UIAlertController(title: title, message: "Congratulations!", preferredStyle: .Alert)
        winAlert.addAction(UIAlertAction(title: "Play Again!", style: .Default, handler: reload))
        presentViewController(winAlert, animated: true, completion: nil)
        
    }
    
    func showDraw() {
        let drawAlert = UIAlertController(title: "It's a draw.", message: "There is no winner!", preferredStyle: .Alert)
        drawAlert.addAction(UIAlertAction(title: "Play Again!", style: .Default, handler: reload))
        presentViewController(drawAlert, animated: true, completion: nil)
    }

    @IBAction func button0Press(sender: UIButton) {
        // disables button
        button0.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button0.setImage(UIImage(named: "0 1.png")!, forState: .Normal)
        }
        else {
            self.button0.setImage(UIImage(named: "0 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[0] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }

    @IBAction func button1Press(sender: UIButton) {
        // disables button
        button1.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button1.setImage(UIImage(named: "1 1.png")!, forState: .Normal)
        }
        else {
            self.button1.setImage(UIImage(named: "1 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[1] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button2Press(sender: UIButton) {
        // disables button
        button2.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button2.setImage(UIImage(named: "2 1.png")!, forState: .Normal)
        }
        else {
            self.button2.setImage(UIImage(named: "2 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[2] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button3Press(sender: UIButton) {
        // disables button
        button3.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button3.setImage(UIImage(named: "3 1.png")!, forState: .Normal)
        }
        else {
            self.button3.setImage(UIImage(named: "3 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[3] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button4Press(sender: UIButton) {
        // disables button
        button4.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button4.setImage(UIImage(named: "4 1.png")!, forState: .Normal)
        }
        else {
            self.button4.setImage(UIImage(named: "4 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[4] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button5Press(sender: UIButton) {
        // disables button
        button5.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button5.setImage(UIImage(named: "5 1.png")!, forState: .Normal)
        }
        else {
            self.button5.setImage(UIImage(named: "5 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[5] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button6Press(sender: UIButton) {
        // disables button
        button6.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button6.setImage(UIImage(named: "6 1.png")!, forState: .Normal)
        }
        else {
            self.button6.setImage(UIImage(named: "6 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[6] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button7Press(sender: UIButton) {
        // disables button
        button7.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button7.setImage(UIImage(named: "7 1.png")!, forState: .Normal)
        }
        else {
            self.button7.setImage(UIImage(named: "7 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[7] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func button8Press(sender: UIButton) {
        // disables button
        button8.userInteractionEnabled = false
        
        // change image on button
        if (player == 1) {
            self.button8.setImage(UIImage(named: "8 1.png")!, forState: .Normal)
        }
        else {
            self.button8.setImage(UIImage(named: "8 -1.png")!, forState: .Normal)
        }
        
        // sets board array piece to player
        board[8] = player
        
        // checks for winner, then runs win function if true
        if (existsWinner()) {
            displayWinner()
        }
        else if (turn == 9) {
            showDraw()
        }
        
        player = player*(-1)
        turn += 1
    }
    
    @IBAction func quitGame(sender: UIButton) {
        let viewController:ViewController = ViewController()
        self.presentViewController(viewController, animated: true, completion: nil)

    }
}
