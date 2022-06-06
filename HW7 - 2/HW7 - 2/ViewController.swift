//
//  ViewController.swift
//  HW7 - 2
//
//  Created by Natalia Givojno on 6.06.22.
//
//передать объект кастомного класса (минимум три свойства) в другой контроллер, там отобразить в labels все свойства

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private func showSecondVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
       let myCat = cat()
        viewController.name = myCat.name
        viewController.breed = myCat.breed
        viewController.okras = myCat.okras
        viewController.weight = myCat.weight
        
        
        present(viewController, animated: true )

    }

    @IBAction func perehod(_ sender: Any) {
        showSecondVC()
    }
}

class cat {
    var name:String = "Tesla"
    var breed:String = "British"
    var okras:String = "grey"
    var weight:String = "Вес 3.4"
    
//    init(name1: String, breed1: String, okras1: String, weight1: String ) {
//           self.name1 = name1
//           self.breed1 = breed1
//           self.okras1 = okras1
//           self.weight1 = weight1
        
   //}
}
