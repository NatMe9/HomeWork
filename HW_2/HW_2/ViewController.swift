//
//  ViewController.swift
//  HW_2
//
//  Created by Natalia Givojno on 15.05.22.
//
//1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций).
//2. Вычислить сумму цифр четырехзначного числа.
//3. Функция сравнения строк – «авб» больше «ввш».
//4. Циклический вызов функций – поломать приложение.
//5. Функция возведения в степень с дефолтным параметром.
//6. Функция вычисления факториала числа.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций).
        minus(a: 8, b: 12)
        print(minus(a: 8.0, b: 12.0))
        plus (a: 8.0, b: 12.0)
        plus (a: 8, b: 12)
        del (a: 8.0, b: 12.0, ctr: 34)
        umn (a: 1, b: 10, c:200)
        
        //        let budjet = convUSD(byn: 10.0, curs: 2.59)
        //        print(budjet)
        //        let budjet2 = convUSD(byn: 300.0, curs: 2.59)
        //        print(budjet2)
        //        print(budjet2/budjet)
        
        //         2. Вычислить сумму цифр четырехзначного числа.
        var chislo:Int = 1956
        
        var total:Int
        
        total  = (sum4(p_chi: &chislo))
        total += (sum4(p_chi: &chislo))
        total += (sum4(p_chi: &chislo))
        total += (sum4(p_chi: &chislo))
        
        print(total) // сумма цифр четырехзначного числа
        print(chislo)
        
        //        3. Функция сравнения строк – «авб» больше «ввш».
        
        
        print(srav(p_str1: "авб", p_str2: "ввш"))
        
        //        4. Циклический вызов функций – поломать приложение.
        //        crash()
        //    Результат:Details
        //
        //        Could not attach to pid : “26993”
        //        Domain: IDEDebugSessionErrorDomain
        //        Code: 7
        //        Failure Reason: “HW_2” failed to launch or exited before the debugger could attach to it. Please verify that “HW_2” has a valid code signature that permits it to be launched on “iPhone 11”. Refer to crash logs and system logs to for more diagnostic
        //        print("не поломалось")
        
        //        5. Функция возведения в степень с дефолтным параметром.
        
        print(vozv(chislo: 3.0))
        
        //        6. Функция вычисления факториала числа
        var f:Int = factorial(5)
        print(f)
        
        
    }
    
    //    1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций).
    func minus(a:Int, b:Int) {
        print(a-b)
    }
    func minus(a:Double, b:Double) -> Double {
//                print(100-a-b)
        return(100-a-b)
    }
    func plus(a:Double, b:Double) {
        print(a + b)
    }
    func plus(a:Int, b:Int) {
        print(a + b + 8)
    }
    func del(a:Double, b:Double, ctr:Double) {
        print(ctr / (a-b))
    }
    func del(a:Int, b:Int, ctr:Int) {
        print(ctr / (a-b))
    }
    func umn(a:Int, b:Int,c:Int) {
        print(a * b * c)
    }
    func umn(a:Double, b:Double,c:Double) {
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
    
    
    func srav(p_str1:String, p_str2:String) -> Bool {
        if p_str1>p_str2 {
            return true
        }
        else if p_str1<p_str2{
            return false
        }
        else {
            return false
        }
        
    }
    
    //    4. Циклический вызов функций – поломать приложение.
    
    func crash(){
        crash()
    }
    
    //    5. Функция возведения в степень с дефолтным параметром.
    
    func vozv(chislo:Double, step:Double = 2) -> Double {
        var a:Double = pow(Double(chislo),step)
        
        return(a)
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

