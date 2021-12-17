//
//  ViewController.swift
//  問答APP
//
//  Created by 王昱淇 on 2021/8/31.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    var questions = Question.data
    var index = 0 {
        willSet {
            changeContents()
        }
    }
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 每次打開 APP 會更改題目順序
        questions.shuffle()
        index = 0
        
        
    }
    
    
 
    
    @IBSegueAction func showGrade(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ResultViewController? {
        ResultViewController(coder: coder, score: score)
    }
    
    func changeContents() {
        questionLabel.text = questions[index].question
        
        var optionArray = [questions[index].optionA,
                           questions[index].optionB,
                           questions[index].optionC,
                           questions[index].optionD]
        // 更改四個選項的順序
        optionArray.shuffle()
       
        // 設定 button title
        for i in 0...3 {
            // answerButtons[i].titleLabel?.font = UIFont(name: "", size: 36)
            answerButtons[i].setTitle(optionArray[i], for: .normal)
            answerButtons[i].tintColor = .black
        }
        questionNumberLabel.text = "\(index + 1) / 10"
        scoreLabel.text = "\(score)"
    }
    
    func restart() {
            score = 0
            index = 0
            questionNumberLabel.text = "\(index + 1) / 10"
            scoreLabel.text = "0"
            questions.shuffle()
        }

    @IBAction func restartButtonAction(_ sender: Any) {
        restart()
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        if sender.currentTitle == questions[index].rightAnswer {
            score += 10
        }
        
        index += 1
       
        if index < 10 {
            changeContents()
        } else {
            performSegue(withIdentifier: "showGrade", sender: nil)
            caculateScore()
          
        }
    }
    
    
    func alert(title: String, message: String, buttonText: String) {
        let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let alertButton = UIAlertAction(title: buttonText, style: .default, handler: {(_)in self.restart() })
        
        let cancelAlertButton = UIAlertAction(title: "取消", style: .destructive, handler: nil)
        
        alertController.addAction(alertButton)
        alertController.addAction(cancelAlertButton)
        
        self.present(alertController, animated: true, completion: nil)
        
      
        }
        
        
    func caculateScore() {
        if score >= 80 {
            alert(title: "總分 \(score) 分", message: "太厲害了！", buttonText: "確定")
        } else if score >= 60 && score < 80 {
            alert(title: "總分 \(score) 分", message: "很棒喔！", buttonText: "確定")
        } else if score >= 30 && score < 60 {
            alert(title: "總分 \(score) 分", message: "加油喔！", buttonText: "確定")
        } else {
            alert(title: "總分 \(score) 分", message: "還要再努力！", buttonText: "確定")
          }
        
    }
    

}
