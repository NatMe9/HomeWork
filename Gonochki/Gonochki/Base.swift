//
//  Base.swift
//  Gonochki
//
//  Created by Natalia Givojno on 12.07.22.
//

import Foundation

class Base{
    
    let defaults = UserDefaults.standard
    
    static let share = Base()
    
    struct UserNameScore:Codable {
        var goncshik: String
        var score: String
        var name:String {
            return "\(goncshik), \(score) "
        }
    }
    
    var resulti:[UserNameScore]{
        get {
           //получаем результат
            if let data = defaults.value(forKey: "results") as? Data {
                return try! PropertyListDecoder().decode([UserNameScore].self, from: data)
            } else {
                return [UserNameScore]()
            }
        }
        set {
            //сохраняем значение, которое приходит когда меняем результат
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "results")
            }
        }
    }
    func saveRes(goncshik:String, score:String) {
        
        if resulti.first?.goncshik == goncshik {
            let result = UserNameScore(goncshik: goncshik, score: score)
            resulti.insert(result, at: 0)
        }
        else {
            let result = UserNameScore(goncshik: goncshik, score: score)
            resulti.insert(result, at: 0)
        }
    }
}
