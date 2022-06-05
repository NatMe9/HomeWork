//
//  SecondViewController.swift
//  trenirovka
//
//  Created by Natalia Givojno on 4.06.22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
   
    @IBOutlet weak var tf2: UITextField!
    
    public var txt: String = ""
    lazy var secondButten = makeSecondButten()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tf2.text = txt
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(secondButten)
        NSLayoutConstraint.activate([
            secondButten.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            secondButten.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondButten.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondButten.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        secondButten.addTarget(self, action: #selector(didLapSecondButton), for: .touchUpInside)
    }
    @objc private func didLapSecondButton() {
            dismiss(animated: true)
                
    }
    
    private func makeSecondButten() -> UIButton{
     let button2 = UIButton()
        button2.backgroundColor = .purple
        button2.setTitle("Верни1", for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }
    
    private func showVC3() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC3") as! VC3
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.txt = self.txt
        present(viewController, animated: true )

    }
    
    @IBAction func showVC3(_ sender: Any) {
        showVC3()
    }
    
    
}
