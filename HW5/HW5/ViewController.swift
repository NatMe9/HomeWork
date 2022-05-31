//
//  ViewController.swift
//  HW5
//
//  Created by Natalia Givojno on 29.05.22.
//
//1) Игрушка для котиков - появление разноцветного кружочка, по тапу исчезает и появляется в новом месте (кодом).
//2) По нажатию кнопки экран заполняется разноцветными квадратами с фиксированной стороной. Квадраты не пересекаются.
//3) На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо, влево. При нажатии кнопки кружок перемещается на фиксированное расстояние. За края экрана не выходит, на кнопки не налезает.


import UIKit

class ViewController: UIViewController {

    let krugok = UIView()
    let centrKrugok = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        krugok.backgroundColor = .purple
        centrKrugok.backgroundColor = .yellow
        
        
        
    }
    @IBAction func FillSquares(_ sender: Any) {
      // заполнить разноцветными квадратами
      
       let maxRazm = view.frame.maxX/10
        print (maxRazm)
        var skolkoLezet:Int = Int(round(view.frame.maxY/maxRazm))
        print (skolkoLezet)
        for j in 1...skolkoLezet {
           
            var y:Double
            if j == 1 { y = 0 }
            else {
                y = maxRazm * Double(j-1)
            }
            
            for i in 1...10 {
                
                let kvadratik = UIView()
                var x:Double
                if i == 1 { x = 0 }
                else {
                    x = maxRazm * Double(i-1)
                }
                    
                kvadratik.frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: maxRazm, height: maxRazm)
                let R = Double.random(in: 0..<255)/255
                let G = Double.random(in: 0..<255)/255
                let B = Double.random(in: 0..<255)/255
                kvadratik.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1.0)
                view.addSubview(kvadratik)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Игрушка для котиков
        krugok.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        krugok.layer.cornerRadius = krugok.frame.height/2
        view.addSubview(krugok)
        
        krugok.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLap)))
        
        // Кружок по центру с кнопками
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        centrKrugok.frame = CGRect(x: xCenter - 200/2 , y: yCenter - 200/2, width:200 , height: 200 )
        centrKrugok.layer.cornerRadius = centrKrugok.frame.height/2
        
        view.addSubview(centrKrugok)
        
}

    @objc func tapLap () {
        let R = Double.random(in: 0..<255)/255
        let G = Double.random(in: 0..<255)/255
        let B = Double.random(in: 0..<255)/255
        krugok.backgroundColor = UIColor(red: R, green: G, blue: B, alpha: 1.0)
        
        krugok.isHidden = true
        let x = Int.random(in: 0..<Int(krugok.frame.maxX))
        let y = Int.random(in: 0..<Int(krugok.frame.maxY))
        krugok.frame = CGRect(x: x, y: y, width: 100, height: 100)
        krugok.isHidden = false
        
    }

   
        
    @IBAction func Up(_ sender: Any) {
        if centrKrugok.frame.origin.y > 15 {
            centrKrugok.frame.origin.y -= 15
         }
    }
    @IBAction func Down(_ sender: Any) {
        if centrKrugok.frame.origin.y < view.frame.maxY - 400 {
            centrKrugok.frame.origin.y += 15
        }
    }
    
    @IBAction func Right(_ sender: Any) {
     print("x = \(centrKrugok.frame.origin.x)    maxX = \(view.frame.maxX)   ")
        if centrKrugok.frame.origin.x < view.frame.maxX - centrKrugok.frame.width - 15 {
            centrKrugok.frame.origin.x += 15
        }
    }
    
    @IBAction func Left(_ sender: Any) {
        if centrKrugok.frame.origin.x > 15 {
            centrKrugok.frame.origin.x -= 15
        }
    }
        
    


}
