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
import AVFoundation


class ViewController: UIViewController {
// let's set up our necessary variables and respective instances
    let roundsPerGame = 6
    var roundsPlayed = 0
    var correctAnswers = 0
    var randomIndexNumber: Int = 0
    var timelineSource = TimelineSource()
    var removedArrayItem = TimelineEvent()
    // audio variables
    var audioPlayer = AVAudioPlayer()
    var gameSound1: SystemSoundID = 0
    var claps1: SystemSoundID = 0
    // global event variables for UIView displays
    var event1 = TimelineEvent()
    var event2 = TimelineEvent()
    var event3 = TimelineEvent()
    var event4 = TimelineEvent()
    // timer variables
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    
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
    @IBOutlet weak var tapToViewInstructions: UILabel!
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
        let place1 = event1.order
        let place2 = event2.order
        event1.order = place2
        event2.order = place1
        print(event1.order)
        print(event2.order)

    }
// timelineEvent2 UIView
    @IBAction func upHalfButton1(_ sender: UIButton) {
        let choice1 = timelineDisplay1.text
        let choice2 = timelineDisplay2.text
        timelineDisplay1.text = choice2
        timelineDisplay2.text = choice1
        let place1 = event1.order
        let place2 = event2.order
        event1.order = place2
        event2.order = place1
        print(event1.order)
        print(event2.order)
    }

    @IBAction func downHalfButton1(_ sender: UIButton) {
        let choice2 = timelineDisplay2.text
        let choice3 = timelineDisplay3.text
        timelineDisplay3.text = choice2
        timelineDisplay2.text = choice3
        let place2 = event2.order
        let place3 = event3.order
        event2.order = place3
        event3.order = place2
        print(event2.order)
        print(event3.order)
    }
// timelineEvent3 UIView
    @IBAction func upHalfButton2(_ sender: UIButton) {
        let choice2 = timelineDisplay2.text
        let choice3 = timelineDisplay3.text
        timelineDisplay3.text = choice2
        timelineDisplay2.text = choice3
        let place2 = event2.order
        let place3 = event3.order
        event2.order = place3
        event3.order = place2
        print(event2.order)
        print(event3.order)
    }
    @IBAction func downHalffButton2(_ sender: UIButton) {
        let choice3 = timelineDisplay3.text
        let choice4 = timelineDisplay4.text
        timelineDisplay3.text = choice4
        timelineDisplay4.text = choice3
        let place3 = event3.order
        let place4 = event4.order
        event3.order = place4
        event4.order = place3
        print(event3.order)
        print(event4.order)
    }
// timelineEvent4 UIView
    @IBAction func upFullButton(_ sender: UIButton) {
        let choice3 = timelineDisplay3.text
        let choice4 = timelineDisplay4.text
        timelineDisplay3.text = choice4
        timelineDisplay4.text = choice3
        let place3 = event3.order
        let place4 = event4.order
        event3.order = place4
        event4.order = place3
        print(event3.order)
        print(event4.order)
    }

// Next Round Correct Button wiring
    @IBAction func failNextRound(_ sender: UIButton) {
        nextRound()
        runTimer()
        if roundsPlayed < roundsPerGame {
            instructions.isHidden = false
            tapToViewInstructions.isHidden = true
        } else {
            instructions.isHidden = true
            tapToViewInstructions.isHidden = true
        }
    }
    
// Next Round Incorrect Button wiring
    @IBAction func successNextRound(_ sender: UIButton) {
        nextRound()
        runTimer()
        if roundsPlayed < roundsPerGame {
            instructions.isHidden = false
            tapToViewInstructions.isHidden = true
        } else {
            instructions.isHidden = true
            tapToViewInstructions.isHidden = true
        }
    }

// Play Again Button wiring
    @IBAction func playAgain(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        playNewGame()
        runTimer()
    }

// ViewDidLoad
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
        tapToViewInstructions.isHidden = true
        loadGameStartSound()
        playGameStartSound()
        runTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
// shake gesture
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            timer.invalidate()
            checkAnswer()

        }
    }
    
    //MARK: these funcitons are not very DRY but they get the job done.  to be refactored
    func eventGeneratorTimlineDisplay1() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event1 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay1.text = event1.event
    }
    
    func eventGeneratorTimlineDisplay2() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event2 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay2.text = event2.event

    }
    
    func eventGeneratorTimlineDisplay3() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event3 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay3.text = event3.event

    }
    
    func eventGeneratorTimlineDisplay4() {
        randomIndexNumber = timelineSource.randomIndexNumberGenerator()
        event4 = timelineSource.randomEvent(at: randomIndexNumber)
        removedArrayItem = timelineSource.arrayItemRemover(at: randomIndexNumber)
        timelineDisplay4.text = event4.event
    }

// timer functionality
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds < 1 {
            displayFinalScore()
        } else {
            seconds -= 1
            timerDisplay.text = timerAppearance(time: TimeInterval(seconds))
        }
    }
    
    func timerAppearance(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%2i:%02i", minutes, seconds)
    }
    
    
// function to check timeline order in a round
    func checkAnswer() {
        roundsPlayed += 1
        timerDisplay.isHidden = true
        
        let eventOrder1 = event1.order
        let eventOrder2 = event2.order
        let eventOrder3 = event3.order
        let eventOrder4 = event4.order
        
        if (eventOrder1 < eventOrder2) && (eventOrder2 < eventOrder3) && (eventOrder3 < eventOrder4) {
            playCorrectDing()
            correctAnswers += 1
            correctNextRound.isHidden = false
            tapToViewInstructions.isHidden = false
            instructions.isHidden = true
        } else {
            playIncorrectBuzz()
            incorrectNextRound.isHidden = false
            tapToViewInstructions.isHidden = false
            instructions.isHidden = true
        }
    }

// function to take player on to the next round
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
    
// function to properly display final score at game's end and give chance to start a new game
    func displayFinalScore() {
        timer.invalidate()
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
        tapToViewInstructions.isHidden = true
        loadEndGameSound()
        playEndGameSound()
    }

// function to start a whole new game
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
    
// incorrect button tap sound effects
    func playIncorrectBuzz() {
        let incorrectBuzz = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav")
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: incorrectBuzz!))
            audioPlayer.play()
        } catch {
        
        }
    }
// correct button tap sound effects
    func playCorrectDing() {
        let correctDing = Bundle.main.path(forResource: "CorrectDing", ofType: "wav")
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: correctDing!))
            audioPlayer.play()
        } catch {
            
        }
    }

// start and end of game sounds
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

