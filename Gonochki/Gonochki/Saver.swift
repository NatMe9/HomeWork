//
//  Saver.swift
//  Gonochki
//
//  Created by Natalia Givojno on 12.07.22.
//

import Foundation

class Saver{
    
    let defaults = UserDefaults.standard
    
    static let getSaver = Saver()
    var currentGoncshik: String = "NoName"
    var currentScore: Int = 0
    
    struct UserNameScore:Codable {
        var goncshik: String
        var score: Int
        var dateString: String
        var name:String {
            return "\(goncshik), рез: \(score), дата: \(dateString)"
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
    
    
    
    //
    func saveRes(goncshik:String, score:Int) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.MM.yy hh:mm"
        let dateString = dateFormatter.string(from: Date())
        
        let result = UserNameScore(goncshik: goncshik, score: score, dateString: dateString)
        resulti.insert(result, at: 0)

    }
}
