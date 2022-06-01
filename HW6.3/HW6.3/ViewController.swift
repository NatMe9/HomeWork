//
//  ViewController.swift
//  HW6.3
//
//  Created by Natalia Givojno on 31.05.22.
//
//• задать сторону квадрата, по нажатию кнопки заполнить экран разноцветными квадратами с указанной стороной (в центре каждого квадрата label с названием цвета)

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after lo'ading the view.
        
    }
    
    @IBOutlet weak var tfStorona: UITextField!
        
    @IBAction func FillSquares(_ sender: Any) {
        fillKvadratikami()
        
    }
    private func fillKvadratikami() {
        var StoronaKvadrata: Double = Double(tfStorona.text ?? "") ?? 10
        print(StoronaKvadrata)
        print ("view.frame.maxX = \(view.frame.maxX)")
        
        //        StoronaKvadrata = view.frame.maxX
        //        let StoronaKvadrata = view.frame.maxX/10
        let kolvoKvadratovX = round(view.frame.maxX / StoronaKvadrata)+1
        print (StoronaKvadrata)
        var kolvoKvadratovY:Int = Int(round(view.frame.maxY/StoronaKvadrata))
        print (kolvoKvadratovY)
        for j in 1...kolvoKvadratovY {
            
            var y:Double
            if j == 1 { y = 0 }
            else {
                y = StoronaKvadrata * Double(j-1)
            }
            
            for i in 1...Int(kolvoKvadratovX) {
                
                let kvadratik = UILabel()
                var x:Double
                if i == 1 { x = 0 }
                else {
                    x = StoronaKvadrata * Double(i-1)
                }
                
                kvadratik.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: StoronaKvadrata, height: StoronaKvadrata)
                let R = Double.random(in: 0..<255)/255
                let G = Double.random(in: 0..<255)/255
                let B = Double.random(in: 0..<255)/255
                kvadratik.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1.0)
                kvadratik.text = kvadratik.backgroundColor?.accessibilityName
                kvadratik.textAlignment = .center
                view.addSubview(kvadratik)
            }
        }
    }
    
}
