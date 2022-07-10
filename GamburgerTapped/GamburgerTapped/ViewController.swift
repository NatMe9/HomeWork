//
//  ViewController.swift
//  GamburgerTapped
//
//  Created by Natalia Givojno on 10.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leading: NSLayoutConstraint!
    
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    var gambOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gambTap(_ sender: Any) {
        
        if gambOut == false {
            leading.constant = 180
            trailing.constant = -180
            gambOut = true
            
            
            
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)

            blurEffectView.frame = view.bounds
            view.insertSubview(blurEffectView, at: 0)
            view.bringSubviewToFront(menu)
        
        } else {
            leading.constant = 0
            trailing.constant = 0
            gambOut = false
            
        }
        
        
    }
    
}

