//
//  SecondViewController.swift
//  HW7 - 2
//
//  Created by Natalia Givojno on 6.06.22.
//

import Foundation
import UIKit
class SecondViewController: UIViewController {
   
    var name = ""
    var breed = ""
    var okras = ""
    var weight = ""
    
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label1.text = name
        label2.text = breed
        label3.text = okras
        label4.text = weight
       
    }
}

