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
        
        blurEffectView.effect = blurEffect
        blurEffectView.tag = 100
        blurEffectView.frame = view.bounds
    }
    
    @IBAction func gambTap(_ sender: Any) {
        
        if gambOut == false {
            leading.constant = 180
            trailing.constant = -180
            gambOut = true
            
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
    
    @IBAction func autorisaze(_ sender: Any) {
        
    }
    
    @IBAction func showAlertOk(_ sender: Any) {
        
        shAlert(title: "AlERT", message: "Test alert!!!" , actionTitles: ["Ok"], actions: [ { action1 in
        }, { action2 in
        }])
        
    }
    

    @IBAction func showAlert(_ sender: Any) {
        
        shAlert(title: "AlERT", message: "Test alert!!!" , actionTitles: ["Ok","Cancel"], actions: [ { action1 in
        }, { action2 in
        }])
    
        
    }
    
    
}

extension UIViewController {
    
    func shAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
}
