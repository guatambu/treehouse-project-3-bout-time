//
//  ViewController.swift
//  Bout Time
//
//  Created by Michael Guatambu Davis on 3/31/17.
//  Copyright © 2017 leme group. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
// let's set up our necessary variables and respective instances
    let roundssPerRound = 6
    var roundsPlayed = 0
    var correctAnswers = 0
    var randomIndexNumber: Int = 0
    var timelineSource = TimelineSource()
    var currentRound = TimelineEvent()
    var removedArrayItem = TimelineEvent()
    var correctDing: SystemSoundID = 0
    var incorrectBuzz: SystemSoundID = 0
    var gameSound1: SystemSoundID = 0
    var claps1: SystemSoundID = 0
    
    
    
// timeline event options display UIView IBOutlets wiring
    @IBOutlet weak var timelineDisplay1: UILabel!
    @IBOutlet weak var timelineDisplay2: UILabel!
    @IBOutlet weak var timelineDisplay3: UILabel!
    @IBOutlet weak var timelineDisplay4: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var incorrectNextRound: UIButton!
    @IBOutlet weak var correctNextRound: UIButton!

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
    @IBAction func nextRoundCorrectButton(_ sender: UIButton) {
        playCorrectDing()
    }

// Next Round Incorrect Button wiring 
    @IBAction func nextRoundIncorrectButton(_ sender: UIButton) {
        playIncorrectBuzz()
    }

// Play Again Button wiring
    @IBAction func playAgainButton(_ sender: UIButton) {
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventGeneratorTimlineDisplay1()
        eventGeneratorTimlineDisplay2()
        eventGeneratorTimlineDisplay3()
        eventGeneratorTimlineDisplay4()
        yourScore.isHidden = true
        finalScore.isHidden = true
        playAgain.isHidden = true
        correctNextRound.isHidden = true
        incorrectNextRound.isHidden = true
        loadGameStartSound()
        playGameStartSound()
        //downFull.isHidden = false
        //upFull.isHidden = false
        //upHalf1.isHidden = false
        //upHalf2.isHidden = false
        //downHalf1.isHidden = false
        //downHalf2.isHidden = false
        
        
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
    
    //MARK: these funcitons are not very DRY but they get the job done.  to be refactored
    func eventGeneratorTimlineDisplay1() {
        var event1: TimelineEvent
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event1 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay1.text = event1.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay2() {
        var event2: TimelineEvent
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event2 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay2.text = event2.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay3() {
        var event3: TimelineEvent
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event3 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay3.text = event3.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay4() {
        var event4: TimelineEvent
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event4 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay4.text = event4.event
        //playAgainButton.isHidden = true
    }
    

    
    // audio sounds functions setup.
    // i admit here i brought in some sounds from the previous project.
    // i feel the UX needs the audio touches.
    func loadCorrectDing() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctDing)
    }
    
    func playCorrectDing() {
        AudioServicesPlaySystemSound(correctDing)
    }
    
    func loadIncorrectBuzz() {
        let pathToSoundFile = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &incorrectBuzz)
    }
    
    func playIncorrectBuzz() {
        AudioServicesPlaySystemSound(incorrectBuzz)
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound1", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound1)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound1)
    }
    
    func loadEndGameSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "Claps1", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &claps1)
    }
    
    func playEndGameSound() {
        AudioServicesPlaySystemSound(claps1)
    }

}








