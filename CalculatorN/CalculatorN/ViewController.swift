//
//  ViewController.swift
//  CalculatorN
//
//  Created by Natalia Givojno on 20.06.22.
//

import UIKit

enum Operation:String {
    case plus = "+"
    case minus = "-"
    case umnog = "*"
    case delit = "/"
    case polOtr = "+/-"
    case proc = "%"
    case null = "null"

}
class ViewController: UIViewController {

    @IBOutlet weak var numbLabel: UILabel!

    var novoeChislo = ""
    var lftVal = ""
    var righVal = ""
    var result = ""
    var currentOperation:Operation = .null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numbLabel.text = "0"
    }

    @IBAction func numbPress(_ sender: RoundButton) {
        if novoeChislo.count <= 9 {
        novoeChislo += "\(sender.tag)"
        numbLabel.text = novoeChislo
        }
    }
    @IBAction func allClean(_ sender: RoundButton) {
        novoeChislo = ""
        lftVal = ""
        righVal = ""
        result = ""
        numbLabel.text = "0"
    }
    @IBAction func tochka(_ sender: RoundButton) {
        if novoeChislo.count <= 8 {
        novoeChislo += "."
        numbLabel.text = novoeChislo
        }
    }
    @IBAction func result(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func slogenie(_ sender: RoundButton) {
        operation(operation: .plus)
    }
    @IBAction func minus(_ sender: RoundButton) {
        operation(operation: .minus)
    }
    @IBAction func ymnogit(_ sender: RoundButton) {
        operation(operation: .umnog)
    }
    @IBAction func podelit(_ sender: RoundButton) {
        operation(operation: .delit)
    }
    @IBAction func percent(_ sender: RoundButton) {
        operation(operation: .proc)
        
    }
    @IBAction func pologOtric(_ sender: RoundButton) {
        operation(operation: .polOtr)
    }
    
    func operation (operation: Operation) {
        if currentOperation != .null {
            if novoeChislo != "" {
              righVal = novoeChislo
                novoeChislo = ""
                
                if currentOperation == .plus {
                    if lftVal == "" {
                        lftVal = "0"
                    }
                    if righVal == "" {
                        righVal = "0"
                    }
                    result = "\(Double(lftVal)! + Double(righVal)!)"
                } else if currentOperation == .minus {
                    if lftVal == "" {
                        lftVal = "0"
                    }
                    if righVal == "" {
                        righVal = "0"
                    }
                    result = "\(Double(lftVal)! - Double(righVal)!)"
                } else if currentOperation == .umnog {
                    if lftVal == "" {
                        lftVal = "1"
                    }
                    if righVal == "" {
                        righVal = "1"
                    }
                    result = "\(Double(lftVal)! * Double(righVal)!)"
                } else if currentOperation == .delit {
                    if lftVal == "" {
                        lftVal = "1"
                    }
                    if righVal == "" {
                        righVal = "1"
                    }
                    result = "\(Double(lftVal)! / Double(righVal)!)"
                } else if currentOperation == .polOtr {
                    
                    result = "\(Double(righVal)! * (-1.0) )"
                }
                else if currentOperation == .proc {
                    
                    result = "\(Double(righVal)! / (100.0) )"
                }
                lftVal = result
                numbLabel.text = result
            }
            
            currentOperation = operation
            
        }
        else if operation == .polOtr {
            if result == "" {
                result = novoeChislo
            }
                result = "\(Double(result)! * (-1.0) )"
                lftVal = result
                novoeChislo = result
                numbLabel.text = result
        }
        else if operation == .proc {
            if result == "" {
                result = novoeChislo
            }
                result = "\(Double(result)! / (100.0) )"
                lftVal = result
                novoeChislo = result
                numbLabel.text = result
        }
        else {
            lftVal = novoeChislo
            novoeChislo = ""
            currentOperation = operation
        }
    }
    
    
    
}

