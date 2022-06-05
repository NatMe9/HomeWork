//
//  ViewController.swift
//  trenirovka
//
//  Created by Natalia Givojno on 4.06.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func showSecondVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
     //   viewController.tf2?.text = self.tf1.text
        viewController.txt = self.tf1.text ?? ""
        present(viewController, animated: true )

    }
    @IBAction func showSecondVC(_ sender: Any) {
        showSecondVC()
    }

}

