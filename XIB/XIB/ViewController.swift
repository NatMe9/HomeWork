//
//  ViewController.swift
//  XIB
//
//  Created by Natalia Givojno on 17.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let customView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as? MyView {
            customView.backgroundColor = UIColor.brown
           
            
            
            customView.alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
            
            view.addSubview(customView)
//            customView.showAlert(self)
            
        }
    }
    @objc func showAlert () {
        let alert = UIAlertController(title: "Hi", message: "Choose you color", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Red", style: .destructive)
        alert.addAction(firstAction)
        let secondAction = UIAlertAction(title: "Blue", style: .cancel) { _ in

        }
        alert.addAction(secondAction)
        let thirdAction = UIAlertAction(title: "Yellow", style: .destructive) { _ in
        }
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }

    
    
    
}

