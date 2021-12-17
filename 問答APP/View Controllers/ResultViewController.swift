//
//  ResultViewController.swift
//  問答APP
//
//  Created by 王昱淇 on 2021/12/17.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int!
    init?(coder: NSCoder, score: Int) {
        self.score = score
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "score:\(score!)"
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
