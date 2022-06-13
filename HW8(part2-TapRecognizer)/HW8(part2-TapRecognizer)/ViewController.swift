//
//  ViewController.swift
//  HW8(part2-TapRecognizer)
//
//  Created by Natalia Givojno on 13.06.22.
//

import UIKit

class ViewController: UIViewController {

    let krug = UIView()
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        krug.backgroundColor = .systemIndigo
       
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        krug.addGestureRecognizer(tapGR)
        
        let screenTapGR = UITapGestureRecognizer(target: self, action: #selector(screenTap))
        view.addGestureRecognizer(screenTapGR)
    }

    
    @objc func screenTap(gesture: UITapGestureRecognizer) {
        krug.isHidden = true
//        let xCenter = view.frame.midX
//        let yCenter = view.frame.midY
        let x = gesture.location(in: self.view).x
        let y = gesture.location(in: self.view).y
//        krug.frame = CGRect(x: xCenter - 100/2 , y: yCenter - 100/2, width:100 , height: 100 )
        krug.frame = CGRect(x: x - 100 / 2, y: y - 100 / 2, width: 100, height: 100)
        krug.layer.cornerRadius = krug.frame.height/2
        view.addSubview(krug)
        krug.isHidden = false
        
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        krug.isHidden = true
    }
    
}

