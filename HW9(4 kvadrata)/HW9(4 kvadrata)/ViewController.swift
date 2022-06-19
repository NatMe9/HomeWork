//
//  ViewController.swift
//  HW9(4 kvadrata)
//
//  Created by Natalia Givojno on 15.06.22.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - mark
    
    @IBOutlet weak var Pink: UIView!
    
    @IBOutlet weak var Indigo: UIView!
    
    @IBOutlet weak var Orange: UIView!
    
    @IBOutlet weak var Yellow: UIView!
    

    @IBAction func Ghmi(_ sender: Any) {
        hiddenMms()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //MARK: 1. создание gesture recognizer (tap gesture)
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        //MARK: 2. создание gesture recognizer (pinch gesture)
                let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(gesture:)))
        //MARK: 3. создание gesture recognizer (swipe gesture)
                let swipeTopG = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
                let swipeBottomG = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gesture:)))
        swipeTopG.direction = UISwipeGestureRecognizer.Direction.up
        swipeBottomG.direction = UISwipeGestureRecognizer.Direction.down
                
        
               // 2. добавление gesture recognizer to a view
        Pink.addGestureRecognizer(tapGesture)
        Pink.addGestureRecognizer(pinchGesture)
        view.addGestureRecognizer(swipeTopG)
        view.addGestureRecognizer(swipeBottomG)
           }

    // 3. этот метод вызывается, когда распознается tap/pinch/swipe
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print(Pink.backgroundColor?.accessibilityName ?? UIColor.systemGreen.accessibilityName)
        if Pink.backgroundColor?.accessibilityName == UIColor.systemBlue.accessibilityName {
            Pink.backgroundColor = UIColor.systemPink
                } else {
                    Pink.backgroundColor = UIColor.systemBlue
                }
           }
    
    @objc func handlePinch(gesture: UIPinchGestureRecognizer) {
            
        if gesture.state == UIGestureRecognizer.State.changed {
                let transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
            Pink.transform = transform
         
            }
        }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        let originalLocationP = Pink.center
        let originalLocationO = Orange.center
        let originalLocationY = Yellow.center
        let originalLocationI = Indigo.center
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.down {
                    UIView.animate(withDuration: 1, animations: {
                        self.Pink.center.y += self.view.bounds.height
                        self.Orange.center.y += self.view.bounds.height
                        self.Yellow.center.y += self.view.bounds.height
                        self.Indigo.center.y += self.view.bounds.height
                        }, completion: { (value: Bool) in
                            self.Pink.center = originalLocationP
                            self.Orange.center = originalLocationO
                            self.Yellow.center = originalLocationY
                            self.Indigo.center = originalLocationI
                    })
        } else if gesture.direction == UISwipeGestureRecognizer.Direction.up {
                    UIView.animate(withDuration: 1, animations: {
                        self.Pink.center.y -= self.view.bounds.height
                        self.Orange.center.y -= self.view.bounds.height
                        self.Yellow.center.y -= self.view.bounds.height
                        self.Indigo.center.y -= self.view.bounds.height
                        }, completion: { (value: Bool) in
                            self.Pink.center = originalLocationP
                            self.Orange.center = originalLocationO
                            self.Yellow.center = originalLocationY
                            self.Indigo.center = originalLocationI
                    })
                }
        
    }
    
    private func hiddenMms () {
        Pink.isHidden = !Pink.isHidden
        Indigo.isHidden = !Indigo.isHidden
        Orange.isHidden = !Orange.isHidden
        Yellow.isHidden = !Yellow.isHidden
        
    }


}

