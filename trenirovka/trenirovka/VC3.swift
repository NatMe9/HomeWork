//
//  VC3.swift
//  trenirovka
//
//  Created by Natalia Givojno on 5.06.22.
//

import Foundation
import UIKit

class VC3: UIViewController {
    public var txt: String = ""
   
    lazy var butten3 = makeButten3()
    
    override func viewDidLoad() {
        let rightBB = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(didLap))
        navigationItem.rightBarButtonItem = rightBB
        
        super.viewDidLoad()
        
    }
    @objc private func didLap(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC4") as! VC4
        navigationController?.pushViewController(viewController, animated: true)
        viewController.txt = self.txt
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(butten3)
        NSLayoutConstraint.activate([
            butten3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            butten3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            butten3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            butten3.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        butten3.addTarget(self, action: #selector(didLapThirdButton), for: .touchUpInside)
    }
    @objc private func didLapThirdButton() {
            dismiss(animated: true)
                
    }
    
    private func makeButten3() -> UIButton{
     let button3 = UIButton()
        button3.backgroundColor = .purple
        button3.setTitle("Верни2", for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        return button3
    }
    
    
    private func showVC4() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC4") as! VC4
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.txt = self.txt
        navigationController?.pushViewController(viewController, animated: true)
//        present(viewController, animated: true )

    }
    
    @IBAction func showVC4(_ sender: Any) {
        showVC4()
    }
    
    
}

