//
//  ViewController.swift
//  HW7part2
//
//  Created by Natalia Givojno on 5.06.22.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMyCat(_ sender: Any) {
        showMyCat()
    }
    
    
    private func showMyCat() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "myCat") as! myCat
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
//        let label = cat()
        
        present(viewController, animated: true )

    }
    

}

