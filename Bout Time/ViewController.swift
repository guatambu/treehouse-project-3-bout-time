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
    let roundsPerGame = 6
    var roundsPlayed = 0
    var correctAnswers = 0
    var randomIndexNumber: Int = 0
    var timelineSource = TimelineSource()
    //var currentRound = TimelineEvent()
    var removedArrayItem = TimelineEvent()
    var correctDing: SystemSoundID = 0
    var incorrectBuzz: SystemSoundID = 0
    var gameSound1: SystemSoundID = 0
    var claps1: SystemSoundID = 0
    var event1 = TimelineEvent()
    var event2 = TimelineEvent()
    var event3 = TimelineEvent()
    var event4 = TimelineEvent()
    
    
    
    
// timeline event options display UIView IBOutlets wiring
    @IBOutlet weak var view1: ViewRoundedCorners!
    @IBOutlet weak var view2: ViewRoundedCorners!
    @IBOutlet weak var view3: ViewRoundedCorners!
    @IBOutlet weak var view4: ViewRoundedCorners!
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
    @IBOutlet weak var timerDisplay: UILabel!

// timeline event options buttons in UIViews IBActions wiring
    
// timelineEvent1 UIView
    @IBAction func downFullButton(_ sender: UIButton) {
        let text1 = timelineDisplay1.text
        let text2 = timelineDisplay2.text
        timelineDisplay1.text = text2
        timelineDisplay2.text = text1
        let eventOrder1 = event1.order
        let eventOrder2 = event2.order
        event1.order = eventOrder2
        event2.order = eventOrder1
        print(event1.order)
        print(event2.order)

    }
// timelineEvent2 UIView
    @IBAction func upHalfButton1(_ sender: UIButton) {
        let text1 = timelineDisplay1.text
        let text2 = timelineDisplay2.text
        timelineDisplay1.text = text2
        timelineDisplay2.text = text1
        let eventOrder1 = event1.order
        let eventOrder2 = event2.order
        event1.order = eventOrder2
        event2.order = eventOrder1
        print(event1.order)
        print(event2.order)
    }
    @IBAction func downHalfButton1(_ sender: Any) {
        let text2 = timelineDisplay2.text
        let text3 = timelineDisplay3.text
        timelineDisplay3.text = text2
        timelineDisplay2.text = text3
        let eventOrder2 = event2.order
        let eventOrder3 = event3.order
        event2.order = eventOrder3
        event3.order = eventOrder2
        print(event2.order)
        print(event3.order)
    }
// timelineEvent3 UIView
    @IBAction func upHalfButton2(_ sender: UIButton) {
        let text2 = timelineDisplay2.text
        let text3 = timelineDisplay3.text
        timelineDisplay3.text = text2
        timelineDisplay2.text = text3
        let eventOrder2 = event2.order
        let eventOrder3 = event3.order
        event2.order = eventOrder3
        event3.order = eventOrder2
        print(event2.order)
        print(event3.order)
    }
    @IBAction func downHalffButton2(_ sender: UIButton) {
        let text3 = timelineDisplay3.text
        let text4 = timelineDisplay4.text
        timelineDisplay3.text = text4
        timelineDisplay4.text = text3
        let eventOrder3 = event3.order
        let eventOrder4 = event4.order
        event3.order = eventOrder4
        event4.order = eventOrder3
        print(event3.order)
        print(event4.order)
    }
// timelineEvent4 UIView
    @IBAction func upFullButton(_ sender: UIButton) {
        let text3 = timelineDisplay3.text
        let text4 = timelineDisplay4.text
        timelineDisplay3.text = text4
        timelineDisplay4.text = text3
        let eventOrder3 = event3.order
        let eventOrder4 = event4.order
        event3.order = eventOrder4
        event4.order = eventOrder3
        print(event3.order)
        print(event4.order)
    }

// Next Round Correct Button wiring

    @IBAction func failNextRound(_ sender: UIButton) {
        nextRound()
    }
    
    



// Next Round Incorrect Button wiring

    @IBAction func successNextRound(_ sender: UIButton) {
        nextRound()
    }
    
    
        


    

// Play Again Button wiring

    @IBAction func playAgain(_ sender: UIButton) {
        playNewGame()
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
        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false
        view4.isHidden = false
        timerDisplay.isHidden = false
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
            checkAnswer()
            //nextRound()
            // roundsPlayed += 1
        }
    }
    
    //MARK: these funcitons are not very DRY but they get the job done.  to be refactored
    func eventGeneratorTimlineDisplay1() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event1 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay1.text = event1.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay2() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event2 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay2.text = event2.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay3() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event3 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay3.text = event3.event
        //playAgainButton.isHidden = true
    }
    
    func eventGeneratorTimlineDisplay4() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event4 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay4.text = event4.event
        //playAgainButton.isHidden = true
    }
    
    func displayScore() {
        
    }
    
    func checkAnswer() {
        roundsPlayed += 1
        timerDisplay.isHidden = true
        
        let eventOrder1 = event1.order
        let eventOrder2 = event2.order
        let eventOrder3 = event3.order
        let eventOrder4 = event4.order
        
        if (eventOrder1 < eventOrder2) && (eventOrder2 < eventOrder3) && (eventOrder3 < eventOrder4) {
            // loadCorrectDing()
            // playCorrectDing()
            correctAnswers += 1
            correctNextRound.isHidden = false

        } else {
            // loadIncorrectBuzz()
            // playIncorrectBuzz()
            incorrectNextRound.isHidden = false
        }
    }
    
    func nextRound() {
        if roundsPlayed == roundsPerGame {
            // Game = over
            displayFinalScore()
            incorrectNextRound.isHidden = true
            correctNextRound.isHidden = true
        } else {
            // Game continues
            eventGeneratorTimlineDisplay1()
            eventGeneratorTimlineDisplay2()
            eventGeneratorTimlineDisplay3()
            eventGeneratorTimlineDisplay4()
            timerDisplay.isHidden = false
            incorrectNextRound.isHidden = true
            correctNextRound.isHidden = true
       }
        
    }
    
    func displayFinalScore() {
        yourScore.isHidden = false
        finalScore.isHidden = false
        finalScore.text = "\(correctAnswers)/\(roundsPerGame)"
        playAgain.isHidden = false
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        timerDisplay.isHidden = true
        instructions.isHidden = true
        loadEndGameSound()
        playEndGameSound()
    }

    func playNewGame() {
        roundsPlayed = 0
        correctAnswers = 0
        timelineSource = TimelineSource()
        event1 = TimelineEvent()
        event2 = TimelineEvent()
        event3 = TimelineEvent()
        event4 = TimelineEvent()
        eventGeneratorTimlineDisplay1()
        eventGeneratorTimlineDisplay2()
        eventGeneratorTimlineDisplay3()
        eventGeneratorTimlineDisplay4()
        yourScore.isHidden = true
        finalScore.isHidden = true
        playAgain.isHidden = true
        correctNextRound.isHidden = true
        incorrectNextRound.isHidden = true
        view1.isHidden = false
        view2.isHidden = false
        view3.isHidden = false
        view4.isHidden = false
        timerDisplay.isHidden = false
        instructions.isHidden = false
        loadGameStartSound()
        playGameStartSound()
    }
    
    
    // audio sounds functions setup.
    // i admit here i brought in some sounds from the previous project.
    // i feel the UX needs the audio touches.
    
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
    
    func loadCorrectDing() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctDing)
    }
    
    func playCorrectDing() {
        AudioServicesPlaySystemSound(claps1)
    }

}








