//
//  ViewController.swift
//  HW3mas
//
//  Created by Natalia Givojno on 17.05.22.
//

import UIKit

class ViewController: UIViewController {

    var x = [(1, "x"), (4, "y"), (6, "a"), (-3, "b")]


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let ilon = x.map{ (Int($0.0 * $0.0), $0.1) }.filter{$0.0 % 2 == 0}.sorted{$0.1 < $1.1}

    print(ilon)
    }


}

