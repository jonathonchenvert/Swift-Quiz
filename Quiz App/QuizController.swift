//
//  ViewController.swift
//  Quiz App
//
//  Created by Jonathon Chenvert on 9/26/2020.
//

import UIKit

class QuizController: UIViewController {

    @IBOutlet weak var quizQuestionLabel: UILabel!
    @IBOutlet weak var correctAnswersCounterLabel: UILabel!
    
    @IBOutlet weak var resetQuizButton: UIButton!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    var selectedQuestion: Int = 0
    var correctAnswers: Int = 0
    var questionsToGoThrough: Int = 4
    var numberOfQuestionsCompleted: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLayouts()
        setCorrectAnswersLabel()
        setQuestionsAndAnswers()
        
    }
    
    // MARK: - Modifies the button layouts
    
    func buttonLayouts() {
        let roundedCornerMultiplier: CGFloat = 0.5
        
        // Automatically create a rounded button from half of the button's height
        answerOneButton.layer.cornerRadius = answerOneButton.frame.height * roundedCornerMultiplier
        answerTwoButton.layer.cornerRadius = answerTwoButton.frame.height * roundedCornerMultiplier
        answerThreeButton.layer.cornerRadius = answerThreeButton.frame.height * roundedCornerMultiplier
        resetQuizButton.layer.cornerRadius = resetQuizButton.frame.height * roundedCornerMultiplier
        
    }
    
    // MARK: - Assigns the questions and answers from the same initial dictionary
    
    func setQuestionsAndAnswers() {
        
        let questions = Questions.questions
        let random = Int.random(in: 0...questions.count - 1)
        
        if selectedQuestion == random {
            selectedQuestion = random % questions.count
        } else {
            selectedQuestion = random
        }
        
        let questionInstance = Array(questions)[selectedQuestion]
        
        // Get the question and its 3 corresponding answers
        let question = questionInstance.key
        let firstAnswer = Array(questionInstance.value)[0].key
        let secondAnswer = Array(questionInstance.value)[1].key
        let thirdAnswer = Array(questionInstance.value)[2].key
                
        // Set the 'Question' label and 'Answers' button
        quizQuestionLabel.text = question
        answerOneButton.setTitle(firstAnswer, for: .normal)
        answerTwoButton.setTitle(secondAnswer, for: .normal)
        answerThreeButton.setTitle(thirdAnswer, for: .normal)
        
    }
    
    // MARK: - Sets the 'Correct Answers' counter
    
    func setCorrectAnswersLabel() {
        
        let outOf = "out of"
        let correct = "correct"
        
        correctAnswersCounterLabel.text = "\(correctAnswers) \(outOf) \(questionsToGoThrough) \(correct)"
        
    }
    
    // MARK: - Checks the bool value from the dictionary's key's value
    
    func checkCorrectAnswer(answer: String) {
        
        numberOfQuestionsCompleted += 1
        
        let questionInstance = Array(Questions.questions)[selectedQuestion]
        
        guard let checkedAnswer = questionInstance.value[answer] else {
            return
        }
        
        if (checkedAnswer) {
            correctAnswers += 1
            
            if correctAnswers == questionsToGoThrough {
                createUIAlert()
            }
            
            setCorrectAnswersLabel()
        }
        
        setQuestionsAndAnswers()
        
    }
    
    // MARK: - Create a UI alert and, optionally, a second one
    
    func createUIAlert() {
        
        let title = "Woo-hoo!"
        let message = "You completed the quiz with \(numberOfQuestionsCompleted) attempts. Want to do it again?"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Adds two actions to UIAlertController
        alert.addAction(UIAlertAction(title: "Sure!", style: .default, handler: { action in
            
            self.resetScores()
            
        }))
        
        alert.addAction(UIAlertAction(title: "No thanks.", style: .cancel, handler: { action in
            
            // Create a secondary alert if the user doesn't want to play again
            let secondTitle = "OK :("
            let secondMessage = "I understand. It gets boring after a while. Go ahead and close the app."
            let secondAlert = UIAlertController(title: secondTitle, message: secondMessage, preferredStyle: .alert)
            
            secondAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.resetScores()
            
            self.present(secondAlert, animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Reset the scores from the UI Alert / Reset button
    
    func resetScores() {
        self.correctAnswers = 0
        self.numberOfQuestionsCompleted = 0
        
        self.setCorrectAnswersLabel()
    }
    
    // MARK: - Resets the Quiz and the 'Correct Answers' counter

    @IBAction func resetQuiz(_ sender: Any) {
        
        print("Reset button pressed.")
        
        // Reset the questions and correct answers counter
        self.resetScores()
        setQuestionsAndAnswers()
        
    }
    
    // MARK: - Actions to take when one of the three buttons have been tapped
    
    @IBAction func firstAnswerTapped(_ sender: Any) {
        
        guard let answer = answerOneButton.titleLabel?.text else {
            return
        }
        
        checkCorrectAnswer(answer: answer)
        
    }
    
    @IBAction func secondAnswerTapped(_ sender: Any) {
        
        guard let answer = answerTwoButton.titleLabel?.text else {
            return
        }
        
        checkCorrectAnswer(answer: answer)
        
    }
    @IBAction func thirdAnswerTapped(_ sender: Any) {
        
        guard let answer = answerThreeButton.titleLabel?.text else {
            return
        }
        
        checkCorrectAnswer(answer: answer)
        
    }
    
}
