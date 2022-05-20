//
//  ViewController.swift
//  HW4
//
//  Created by Natalia Givojno on 20.05.22.
//
//Класс Beer, свойства: имя, цена, страна, остаток объема.
//• Реализовать продажу пива через менеджер-синглтон.
//• Проверка выручки в конце дня.
//• Начало новой смены - обнуление выручки, проверка остатков.
//• Графический интерфейс самостоятельно.


import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var Info: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ProdatPivo(_ sender: Any) {
        BeerSeller.seller.sellBeer()
        Info.text = "Пиво продано, заходьте ще"
    }
    
    @IBAction func ProveritVyruchku(_ sender: Any) {
        let t:Double = BeerSeller.seller.getVyruchka()
        Info.text = "Выручка составила \(t) денег"
    }

    @IBAction func ProveritOstatki(_ sender: Any) {
        let n:Int = BeerSeller.seller.checkBalances()
        Info.text = "Остаток от продаж \(n)"
    }
    
    @IBAction func KonecDnia(_ sender: Any) {
        BeerSeller.seller.clearVyruchka()
        Info.text = "Ура, завтра новый день=)"
        
    }
    


}

