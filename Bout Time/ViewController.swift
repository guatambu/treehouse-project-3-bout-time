//
//  ViewController.swift
//  Bout Time
//
//  Created by Michael Guatambu Davis on 3/31/17.
//  Copyright © 2017 leme group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// timeline event options display UIView IBOutlets wiring
    @IBOutlet weak var timelineDisplay1: UILabel!
    @IBOutlet weak var timelineDisplay2: UILabel!
    @IBOutlet weak var timelineDisplay3: UILabel!
    @IBOutlet weak var timelineDisplay4: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var yourScore: UILabel!

// timeline event options buttons in UIViews IBActions wiring
// timelineEvent1 UIView
    @IBAction func downFullButton(_ sender: UIButton) {
    }
// timelineEvent2 UIView
    @IBAction func upHalfButton1(_ sender: UIButton) {
    }
    @IBAction func downHalfButton1(_ sender: Any) {
    }
// timelineEvent3 UIView
    @IBAction func upHalfButton2(_ sender: UIButton) {
    }
    @IBAction func downHalffButton2(_ sender: UIButton) {
    }
// timelineEvent4 UIView
    @IBAction func upFullButton(_ sender: UIButton) {
    }

// Next Round Correct Button wiring
    @IBAction func nextRoundSuccess(_ sender: UIButton) {
    }
    
// Next Round Incorrect Button wiring 
    @IBAction func nextRoundFail(_ sender: UIButton) {
    }
    
// Play Again Button wiring
    @IBAction func palyAgain(_ sender: UIButton) {
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            // run code to check for correct answer
        }
    }
    
    


}








