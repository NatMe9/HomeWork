//
//  Sale of beer.swift
//  HW4
//
//  Created by Natalia Givojno on 20.05.22.
//Singleton
//1.Продажа пива
//2. Проверить выручку в конце дня
//3. Обнулить выручку
//4. проверить остатки

import Foundation

class BeerSeller {
   
    //Private prop
    private var ostatki: Int = 0
    private var soldBeerCount = 0
    
    //Public prop
     static let seller = BeerSeller()
    private var beer = Beer(BRAND: "Baltas", PRICE: 3, COUNTRY: "Lithuania", OST: 1000)
    
    //Public flow func
    //1.Продажа пива - 50 раз продать пиво, потом посчитать сумму и проверить остатки
     func sellBeer() {
        soldBeerCount += 1
        ostatki = ostatki - 1
    }
    
     func getBeerCount() -> Int {
        return soldBeerCount
    }
//    2. Проверить выручку в конце дня
    
     func getVyruchka() -> Double {
         return Double(soldBeerCount) * beer.getPrice()
    }
    //3. Обнулить выручку
    
     func clearVyruchka() {
         soldBeerCount = 0
}
    //4. проверить остатки
    
     func checkBalances() -> Int {
        return ostatki
    }
   
    //Private flow func
    private init() {
        ostatki = beer.ost
    }
}
