//
//  Beer.swift
//  HW4
//
//  Created by Natalia Givojno on 20.05.22.
//

import Foundation

class Beer {
// Public prop
    public var brand: String
    private var price: Double
    public var country: String
    public var ost: Int
    
    public func getPrice ()->Double {
        return self.price
    }
    public func setPrice (newPrice:Double){
        self.price = newPrice
    }
    
// Life cycle
     init(BRAND: String, PRICE: Double, COUNTRY: String, OST: Int) {
        self.brand = BRAND
        self.price = PRICE
        self.country = COUNTRY
        self.ost = OST
    }
    
}








