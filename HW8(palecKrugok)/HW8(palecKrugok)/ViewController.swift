//
//  ViewController.swift
//  HW8(palecKrugok)
//
//  Created by Natalia Givojno on 10.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    let myCircle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCircle.backgroundColor = .systemGreen
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragCircle))
        myCircle.addGestureRecognizer(panGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        myCircle.frame = CGRect(x: xCenter - 200/2 , y: yCenter - 200/2, width:200 , height: 200 )
        myCircle.layer.cornerRadius = myCircle.frame.height/2
        
        view.addSubview(myCircle)
    }
    
    @objc func dragCircle(recognizer: UIPanGestureRecognizer){
        
        if recognizer.state == .began {
            
        }
        else if recognizer.state == .changed {
            let tL = recognizer.translation(in: self.view)
           
            let newX = myCircle.center.x + tL.x
            let newY = myCircle.center.y + tL.y
            
            myCircle.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        else if recognizer.state == .ended {
            
        }
    }
    
}

