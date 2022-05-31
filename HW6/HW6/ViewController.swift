//
//  ViewController.swift
//  HW6
//
//  Created by Natalia Givojno on 31.05.22.
//

import UIKit



class ViewController: UIViewController {
    
    let centrKrugok = UIView()
    
    enum peremeschenia {
        case UP
        case DOWN
        case LEFT
        case RIGHT
        
    }
    @IBOutlet weak var giveCommand: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        centrKrugok.backgroundColor = .purple
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        centrKrugok.frame = CGRect(x: xCenter - 200/2 , y: yCenter - 200/2, width:200 , height: 200 )
        centrKrugok.layer.cornerRadius = centrKrugok.frame.height/2
        
        view.addSubview(centrKrugok)
    }
    
    @IBAction func UP(_ sender: Any) {
        movingKrugok(direction: .UP)
    }
    @IBAction func DOWN(_ sender: Any) {
        movingKrugok(direction: .DOWN)

    }
    @IBAction func LEFT(_ sender: Any) {
        movingKrugok(direction: .LEFT)
    }
    @IBAction func RIGHT(_ sender: Any) {
        movingKrugok(direction: .RIGHT)
    }
    func movingKrugok (direction: peremeschenia) {
        switch direction {
        case.UP:
            if centrKrugok.frame.origin.y > 15 {
                centrKrugok.frame.origin.y -= 15
                giveCommand.text = "Нажата вверх"
                giveCommand.backgroundColor = .systemGreen
            }
            else {
                giveCommand.text = "Ошибка!Вверх больше нельзя"
                giveCommand.backgroundColor = .red
                giveCommand.textColor =  .white
            }
        case .DOWN:
            if centrKrugok.frame.origin.y < view.frame.maxY - 450 {
                centrKrugok.frame.origin.y += 20
                giveCommand.text = "Нажата вниз"
                giveCommand.backgroundColor = .systemGreen
            }
            else {
                giveCommand.text = "Ошибка!Вниз больше нельзя"
                giveCommand.backgroundColor = .red
                giveCommand.textColor =  .white
            }
        case.LEFT:
            if centrKrugok.frame.origin.x > 15 {
                centrKrugok.frame.origin.x -= 20
                giveCommand.text = "Нажата влево"
                giveCommand.backgroundColor = .systemGreen
            }
            else {
                giveCommand.text = "Ошибка!Влево больше нельзя"
                giveCommand.backgroundColor = .red
                giveCommand.textColor =  .white
            }
        case .RIGHT:
            if centrKrugok.frame.origin.x < view.frame.maxX - centrKrugok.frame.width - 15 {
                centrKrugok.frame.origin.x += 20
                giveCommand.text = "Нажата вправо"
                giveCommand.backgroundColor = .systemGreen
                
            }
            else {
                giveCommand.text = "Ошибка!Вправо больше нельзя"
                giveCommand.backgroundColor = .red
                giveCommand.textColor =  .white
            }
        }
        
        
        
        
    }
    
    
}

