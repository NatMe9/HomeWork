//
//  ViewController.swift
//  Save Image with password(File Manager)
//
//  Created by Natalia Givojno on 18.07.22.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }
    @IBAction func tapShowUIImage(_ sender: Any) {
        tapShowPassAlert()
    }
    
    @objc private func tapShowPassAlert() {
        
       let alert = UIAlertController(title: "Your password?", message: "12345678", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.isSecureTextEntry = true
        let submitAction = UIAlertAction(title: "OKi", style: .default) { _ in
            let password = alert.textFields?.first
            
            if password?.text == "12345678" {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "ImageVC")as? imageView else {
                    return
                }
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
        
    }
    
    
}

