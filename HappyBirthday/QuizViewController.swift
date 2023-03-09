//
//  QuizViewController.swift
//  HappyBirthday
//
//  Created by swift on 09.03.2023.
//

//import UIKit
//
//
//
//class QuizViewController: UIViewController {
//
//    @IBOutlet weak var questionLabel: UILabel!
//    @IBOutlet weak var answer1: UIButton!
//    @IBOutlet weak var answer2: UIButton!
//    @IBOutlet weak var answer3: UIButton!
//    @IBOutlet weak var answer4: UIButton!
//
//
//
//    var currentAnswer = Int()
//    var realAnswer = Int()
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//struct QuizTemplete {
//    var question = String()
//    var answer = Int()
//    var amswers = [String]()
//        }
//
//        var quiz = [QuizTemplete]()
//
//        quiz = [QuizTemplete(question: "how old are you", answer: 2, amswers: ["22","15","43","5"]),
//             QuizTemplete(question: "Which capital of France", answer: 1, amswers: ["Paris","England","Astana","Almaty"]),
//             QuizTemplete(question: "Where spend euro - 2012", answer: 4, amswers: ["Polska","Kazakhstan","Dubai","Russia"])]
//
//
//    }
//
//
//
//
//
//
//    @IBAction func answer1Action(_ sender: Any) {
//        currentAnswer = 0
//    }
//    @IBAction func answer2Action(_ sender: Any) {
//        currentAnswer = 1
//    }
//    @IBAction func answer3(_ sender: Any) {
//        currentAnswer = 2
//    }
//    @IBAction func answer4Action(_ sender: Any) {
//        currentAnswer = 3
//    }
//
//
//}

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    var currentAnswer = Int()
    var realAnswer = Int()
    
    struct QuizTemplete {
        var question = String()
        var answer = Int()
        var answers = [String]()
    }
    
    var quiz = [QuizTemplete]()
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = [
            QuizTemplete(question: "How old are you", answer: 1, answers: ["22","15","43","5"]),
            QuizTemplete(question: "Which capital of France", answer: 0, answers: ["Paris","England","Astana","Almaty"]),
            QuizTemplete(question: "Where was Euro 2012 held", answer: 3, answers: ["Polska","Kazakhstan","Dubai","Russia"])
        ]
        
        updateUI()
    }
    
    func updateUI() {
        let currentQuestion = quiz[currentQuestionIndex]
        
        questionLabel.text = currentQuestion.question
        answer1.setTitle(currentQuestion.answers[0], for: .normal)
        answer2.setTitle(currentQuestion.answers[1], for: .normal)
        answer3.setTitle(currentQuestion.answers[2], for: .normal)
        answer4.setTitle(currentQuestion.answers[3], for: .normal)
        
        realAnswer = currentQuestion.answer
    }
    
    func checkAnswer() {
        if currentAnswer == realAnswer {
            view.backgroundColor = UIColor.green
            // Ждём 1 секунду, затем переходим к следующему вопросу
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextQuestion()
            }
        } else {
            view.backgroundColor = UIColor.red
            // Ждём 1 секунду, затем возвращаем обычный цвет фона
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.view.backgroundColor = UIColor.white
            }
        }
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex < quiz.count {
            updateUI()
        } else {
            // Все вопросы заданы, завершаем игру
            // Здесь вы можете добавить код для показа результата игры или другой логики
            // ...
        }
    }
    
    @IBAction func answer1Action(_ sender: Any) {
        currentAnswer = 0
        checkAnswer()
    }
    
    @IBAction func answer2Action(_ sender: Any) {
        currentAnswer = 1
        checkAnswer()
    }
    
    @IBAction func answer3Action(_ sender: Any) {
        currentAnswer = 2
        checkAnswer()
    }
    
    @IBAction func answer4Action(_ sender: Any) {
        currentAnswer = 3
        checkAnswer()
   
    }
    
}
