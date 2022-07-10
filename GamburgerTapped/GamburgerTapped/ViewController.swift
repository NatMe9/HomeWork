//
//  ViewController.swift
//  GamburgerTapped
//
//  Created by Natalia Givojno on 10.07.22.
//

import UIKit

class ViewController: UIViewController {

    let blurEffect = UIBlurEffect(style: .dark)
    let blurEffectView = UIVisualEffectView()
    

    
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var fon: UIView!
    var gambOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.effect = blurEffect
        blurEffectView.tag = 100
        blurEffectView.frame = view.bounds
    }

    @IBAction func gambTap(_ sender: Any) {
        
        if gambOut == false {
            leading.constant = 180
            trailing.constant = -180
            gambOut = true
            
            
            
    
//            view.insertSubview(blurEffectView, at: 0)
            fon.addSubview(blurEffectView)
        
        } else {
            leading.constant = 0
            trailing.constant = 0
            gambOut = false
            
            if let viewWithTag = fon.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                }else{
                    print("No!")
                }
            
        }
        
        
    }
    
}

