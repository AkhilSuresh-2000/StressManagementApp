//
//  ViewController.swift
//  StressManagementApp
//
//  Created by Akhil Suresh on 2021-03-24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var appDescription: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        notifications()
    }
    
    func notifications(){
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert , .sound]) { (granted, error) in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Grab a glass of water"
        content.body = "Sometimes you are not tired, you just need a glass of water"
    
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
       let trigger =  UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidStrig = UUID().uuidString
        
       let request =   UNNotificationRequest(identifier: uuidStrig, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            
            //handle errors
            print("error showing notification")
            
        }
    }
    
    
    @IBAction func btnStart(_ sender: Any) {
        
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    @IBAction func btnStress(_ sender: Any) {
        
        performSegue(withIdentifier: "toStressViewController", sender: nil)
    }
    
    

}

extension String{
    
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
