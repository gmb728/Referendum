//
//  ViewController.swift
//  Referendum
//
//  Created by Chang Sophia on 11/29/18.
//  Copyright © 2018 Chang Sophia. All rights reserved.
//

import UIKit
var Total: Int = 0
var Sum: Int = 0

class ViewController: UIViewController {
    
    var explainText: String?
    var numberName: String?
    var subjectName: String?
    var button = " "
    
    var subjectCount = 0
    
    func agreeVote () {
        Total = Total + 1 }
    func disagreeVote () {
        Sum = Sum + 1
    }
        
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var disagreeButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var explainTextView: UITextView!
    @IBOutlet weak var openButton: UIButton!
    
    @IBAction func openButtonPressed(_ sender: Any) {
        
        if  Total == 0 || Sum == 0 {
            let alertController = UIAlertController(
                title: "投票尚未完成", message: "請繼續排隊", preferredStyle: .alert)
            
            let okAction = UIAlertAction(
                title: "確認", style: .default,
                handler:{
                    (action: UIAlertAction!) -> Void in
            })
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
          
            } else {
           
            let alertController = UIAlertController(
                title: "投票結束", message: "同意 \(Total) 票, 不同意 \(Sum) 票,", preferredStyle: .alert)
            
            let okAction = UIAlertAction(
                title: "確認", style: .default,
                handler:{
                    (action: UIAlertAction!) -> Void in
            })
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    
//button disabled
    @IBAction func buttonDisabled(_ sender: Any) {
       button = "agreebutton"
        agreeButton.isEnabled = false
        agreeVote()
       
    }
       
    @IBAction func disagreeDisabled(_ sender: Any) {
    button = "disagreebutton"
        disagreeButton.isEnabled = false
      disagreeVote()
      
    }
    
    func changeAction() {
        if let _ = subjectName,
            let text = explainText, let number = numberName {
            numberLabel.text = number
            explainTextView.text = text
           
        }
    }
    
    
   
    override func viewDidLoad() {
       changeAction()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
   

}
