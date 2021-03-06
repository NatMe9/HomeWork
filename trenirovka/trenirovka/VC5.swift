//
//  VC5.swift
//  trenirovka
//
//  Created by Natalia Givojno on 5.06.22.
//

import Foundation
import UIKit

class VC5: UIViewController {
   
    @IBOutlet weak var tf5: UITextField!
    
    
    public var txt: String = ""
   lazy var butten5 = makeButten5()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton().self
        button.setTitle("Go to start", for: .normal)
        button.addTarget(self, action: #selector(didLapToStart), for: .touchUpInside)
        let rightBB = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = rightBB
        
        
        tf5.text = txt
    }
    
    @objc private func didLapToStart() {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(butten5)
        NSLayoutConstraint.activate([
            butten5.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            butten5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            butten5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            butten5.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        butten5.addTarget(self, action: #selector(didLapFifthButton), for: .touchUpInside)
    }
    @objc private func didLapFifthButton() {
            dismiss(animated: true)
                
    }
    
    private func makeButten5() -> UIButton{
     let button5 = UIButton()
        button5.backgroundColor = .purple
        button5.setTitle("Верни4", for: .normal)
        button5.translatesAutoresizingMaskIntoConstraints = false
        return button5
    }
    
}
