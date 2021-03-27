//
//  StressViewController.swift
//  StressManagementApp
//
//  Created by Akhil Suresh on 2021-03-26.
//

import UIKit

class StressViewController: UIViewController{
    
    let questions = ["Do you experience any of the following symptoms: headaches, chest pain, muscle tension, nausea, or changes in sex drive?",
     "Do you experience fatigue and/or struggle to fall or stay asleep?",
    "Do you worry excessively and feel overwhelmed with responsibilities?",
    "Do you struggle to focus on tasks or stay motivated?"]
    
    let answers = [["Never","Rarely","Sometimes","Often"],
                   ["Never","Rarely","Sometimes","Often"],
                   ["Never","Rarely","Sometimes","Often"],
                   ["Never","Rarely","Sometimes","Often"]
                   
    ]
    
    
    var currentQuestion = 0
    var score = 0;
    
    

    
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        generateQuestions()
        
    }
    
    enum SelectedButtonTag: Int {
        case First
        case Second
        case Third
        case Fourth
    }
    
    
    @IBAction func btnScorePress(_ sender: UIButton) {
        
        if(sender.tag == 1){
            
           //print("Btn 1 pressed")
           score += 0
        }
        else if(sender.tag == 2){
            //print("Btn 2 pressed")
            score += 2
        }
        else if(sender.tag == 3){
            //print("Btn 3 pressed")
            score += 4
        }
        else if(sender.tag == 4){
            //print("Btn 4 pressed")
            score += 4
        }
        else{
            print("nothing ")
        }
        
        if(currentQuestion != questions.count){
            generateQuestions()
        }
        
        else{
            
            let alert = UIAlertController(title: "Score", message: " Your Stress level \(score)", preferredStyle: .alert)

           
            self.present(alert, animated: true)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
            
            
           
            

           

        }
    }
    

    func generateQuestions(){
        lblQuestion.text = questions[currentQuestion]
         var button:UIButton = UIButton()
         //var x = 1
        
        for i in 1...4{
            button = view.viewWithTag(i) as! UIButton
            if(i == 1){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            if(i == 2){
                button.setTitle(answers[currentQuestion][1], for: .normal)
            }
            if(i == 3){
                button.setTitle(answers[currentQuestion][2], for: .normal)
            }
            if(i == 4){
                button.setTitle(answers[currentQuestion][3], for: .normal)
            }
            
        }
         
        
        currentQuestion += 1
    }
    

}
    

