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
}

class GameSettings: UIViewController {
  
    let dedaults = UserDefaults.standard
    
    @IBOutlet weak var labelGoncsh: UILabel!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var Gonshik: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //грузим данные при загрузке экрана
        
        Gonshik.text = dedaults.string(forKey: keyDefaults.keyGonshik)
        
        
        
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
            dedaults.set(goncshik, forKey: keyDefaults.keyGonshik)
            
        }
        
    }
    
}



