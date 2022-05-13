//
//  ViewController.swift
//  p_storyboard_2
//
//  Created by Natalia Givojno on 10.05.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Домашнее задание:
        // • Сумма отдельно целых и отдельно дробных частей чисел: 2.5, 9.7, 6.9, 8.2.
        // • Проверка, является ли число четным.
        //Дедлайн 14.05.2022 00:00
        //Если есть какие-то форс-мажоры из-за которых не успеваете сделать домашку, предупреждайте об этом.
        //
//        var n: Int
        let t1 = 2.5
        let t2 = 9.7
        let t3 = 6.9
        let t4 = 8.2
//
//        n = Int(t1)+Int(t2)+Int(t3)+Int(t4)
//
//        print (n)
//
//        var g: Double
//
//        g = (t1+t2+t3+t4)-Double(n)
//
//        print (g)
//
        // вариант 2
        var z: Double

        let m1 = t1-Double(Int(t1))
        let m2 = t2-Double(Int(t2))
        let m3 = t3-Double(Int(t3))
        let m4 = t4-Double(Int(t4))
        z = m1+m2+m3+m4
        print(z)
//
//        var v = 5
//        if (v%2)==1 {
//            print ("нечетное")
//        } else {
//            print ("четное")
//        }
//
//        v = 8
//        if (v%2)==1 {
//            print ("нечетное")
//        } else {
//            print ("четное")
//        }
//
    }


}
//
