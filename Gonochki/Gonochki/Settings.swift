//
//  Settings.swift
//  Gonochki
//
//  Created by Natalia Givojno on 3.07.22.
//

import Foundation
import UIKit

struct keyDefaults {
    static let keyGonshik = "gn"
    static let keyScore = "sc"
}

class GameSettings: UIViewController {
  
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var labelGoncsh: UILabel!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var Gonshik: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //грузим данные при загрузке экрана
        
//        Gonshik.text = defaults.string(forKey: keyDefaults.keyGonshik)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
     
       
        buttonSave.addCornerRadius()
        buttonSave.addShadow()
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        let goncshik = Gonshik.text!
       //проверяем заполнено ли
        if !goncshik.isEmpty {
//            Saver.getSaver.saveRes(goncshik: goncshik, score: "")
            Saver.getSaver.currentGoncshik = goncshik
            //defaults.set(goncshik, forKey: keyDefaults.keyGonshik)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}



