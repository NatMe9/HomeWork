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
        
//    HomeWork 2
        let hw2 = task2()
        //        1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций).
        hw2.minus(a: 8, b: 12)
        hw2.minus(a: 8.0, b: 12.0)
        hw2.minus(a: 8.0, b: 12.0, ctr: 34)
        hw2.minus(a: 1, b: 10, c:200)
        
        //        let budjet = convUSD(byn: 10.0, curs: 2.59)
        //        print(budjet)
        //        let budjet2 = convUSD(byn: 300.0, curs: 2.59)
        //        print(budjet2)
        //        print(budjet2/budjet)
        
        //         2. Вычислить сумму цифр четырехзначного числа.
        var chislo:Int = 1956
        
        var total:Int
        
        total  = (hw2.sum4(p_chi: &chislo))
        total += (hw2.sum4(p_chi: &chislo))
        total += (hw2.sum4(p_chi: &chislo))
        total += (hw2.sum4(p_chi: &chislo))
        
        print(total) // сумма цифр четырехзначного числа
        print(chislo)
        
        //        3. Функция сравнения строк – «авб» больше «ввш».
        
        
        hw2.srav(p_str1: "авб", p_str2: "ввш")
        
//        4. Циклический вызов функций – поломать приложение.
//        hw2.crash()
//    Результат:Details
//
//        Could not attach to pid : “26993”
//        Domain: IDEDebugSessionErrorDomain
//        Code: 7
//        Failure Reason: “HW_2” failed to launch or exited before the debugger could attach to it. Please verify that “HW_2” has a valid code signature that permits it to be launched on “iPhone 11”. Refer to crash logs and system logs to for more diagnostic
//        print("не поломалось")
        
//        5. Функция возведения в степень с дефолтным параметром.
       
        hw2.vozv(chislo: 3.0)
        
//        6. Функция вычисления факториала числа
        let f:Int = hw2.factorial(5)
        print(f)
        
    }

    
    
}
//
class task2{
    //    1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций).
    func minus(a:Int, b:Int) {
        print(a-b)
    }
    func minus(a:Double, b:Double) {
        print(100 + (a-b))
    }
    func minus(a:Double, b:Double, ctr:Double) {
        print(ctr / (a-b))
    }
    func minus(a:Int, b:Int,c:Int) {
        print(a * b * c)
    }
    
    //    func convUSD(byn:Double, curs:Double) -> Double {
    //        return(byn * curs)
    //    }
    
    //    2. Вычислить сумму цифр четырехзначного числа.
    
    func sum4(p_chi: inout Int) -> Int {
        let res: Int
        res = (p_chi) % 10
        p_chi = Int(p_chi/10)
        
        
        return res
    }
//    3. Функция сравнения строк – «авб» больше «ввш».
    
    
    func srav(p_str1:String, p_str2:String){
        if p_str1>p_str2 {
            print("первая строка больше второй")
        }
        else if p_str1<p_str2{
            print("вторая строка больше первой")
        }
        else {
            print("строки равны")
        }
        
    }
    
//    4. Циклический вызов функций – поломать приложение.
    
    func crash(){
        crash()
    }
    
//    5. Функция возведения в степень с дефолтным параметром.
    
    func vozv(chislo:Double, step:Double = 2){
        let a:Double = pow(Double(chislo),step)
        print(a)
    }
//    6. Функция вычисления факториала числа
    func factorial(_ chislo:Int) -> Int {
        if chislo < 1 {
            return 1
        } else {
            return chislo * factorial(chislo-1)
        }
   
    }



}
