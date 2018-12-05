//
//  SubjectTableViewController.swift
//  Referendum
//
//  Created by Chang Sophia on 11/29/18.
//  Copyright © 2018 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class SubjectTableViewController: UITableViewController {
   
    @IBOutlet var subjectTextField: [UITextView]!
    @IBOutlet var numberLabel: [UILabel]!
    

   
    let synthesizer = AVSpeechSynthesizer()
    var subjects = [Information]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubjects()
        for (i, label) in subjectTextField.enumerated() {
            label.text = subjects[i].name
        }
        for (j, label) in numberLabel.enumerated() {
            label.text = subjects[j].number
        }
      
        }
    
       func initSubjects() {
    
        subjects.append(Information(name: "你是否同意以平均每年至少降低1%之方式逐年降低火力發電廠發電量？", number: "7", explainText: explainKeys.number7))
        subjects.append(Information(name: "您是否同意確立「停止新建、擴建任何燃煤發電廠或發電機組（包括深澳電廠擴建）」之能源政策？", number: "8", explainText: explainKeys.number8))
        subjects.append(Information(name: "你是否同意政府維持禁止開放日本福島 311 核災相關地區，包括福島與周遭4縣市(茨城、櫪木、群馬、千葉)等地區農產 品及食品進口?", number: "9", explainText: explainKeys.number9))
        subjects.append(Information(name: "你是否同意民法婚姻規定應限定在一男一女的結合?", number: "10", explainText: explainKeys.number10))
        subjects.append(Information(name: "你是否同意在國民教育階段內(國中及國小)，教育部及各級學校不應對學生實施性別平等教育法施行細則所定之同志教育?", number: "11", explainText: explainKeys.number11))
        subjects.append(Information(name: "你是否同意以民法婚姻規定以外之其他形式來保障同性別二人經營永久共同生活的權益?", number: "12", explainText: explainKeys.number12))
        subjects.append(Information(name: "你是否同意，以「台灣」(Taiwan)為全名申請參加所有國際運動賽事及 2020 年東京奧運?", number: "13", explainText: explainKeys.number13))
        subjects.append(Information(name: "您是否同意，以民法婚姻章保障同性別二人建立婚姻關係?", number: "14", explainText: explainKeys.number14))
        subjects.append(Information(name: "您是否同意，以「性別平 等教育法」明定在國民教 育各階段內實施性別平等教育，且內容應涵蓋情 感教育、性教育、同志教 育等課程?", number: "15", explainText: explainKeys.number15))
        subjects.append(Information(name: "您是否同意:廢除電業法第 95 條第 1 項，即廢除 「核能發電設備應於中華民國一百十四年以前， 全部停止運轉」之條文?", number: "16", explainText: explainKeys.number16))
        }
        
        
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 
 
    */
    //speak
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let utterance = AVSpeechUtterance(string: subjects[indexPath.row].name)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(utterance)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let row = tableView.indexPathForSelectedRow?.row {
            let controller = segue.destination as? ViewController
            controller?.subjectName = subjects[row].name
            controller?.numberName = subjects[row].number
             controller?.explainText = subjects[row].explainText
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension   
        
    }

  
}
