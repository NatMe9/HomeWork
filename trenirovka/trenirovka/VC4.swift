//
//  VC4.swift
//  trenirovka
//
//  Created by Natalia Givojno on 5.06.22.
//

import Foundation
import UIKit

class VC4: UIViewController {
    public var txt: String = ""
   
    lazy var butten4 = makeButten4()
    
    override func viewDidLoad() {
        let rightBB = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(didLap))
        navigationItem.rightBarButtonItem = rightBB
        super.viewDidLoad()
        
    }
    @objc private func didLap(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC5") as! VC5
        navigationController?.pushViewController(viewController, animated: true)
        viewController.txt = self.txt
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addSubview(butten4)
        NSLayoutConstraint.activate([
            butten4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            butten4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            butten4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            butten4.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        butten4.addTarget(self, action: #selector(didLapFourthButton), for: .touchUpInside)
    }
    @objc private func didLapFourthButton() {
            dismiss(animated: true)
                
    }
    
    private func makeButten4() -> UIButton{
     let button4 = UIButton()
        button4.backgroundColor = .purple
        button4.setTitle("Верни3", for: .normal)
        button4.translatesAutoresizingMaskIntoConstraints = false
        return button4
    }
  
    private func showVC5() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC5") as! VC5
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.txt = self.txt
        navigationController?.pushViewController(viewController, animated: true)
//        present(viewController, animated: true )

    }
    @IBAction func showVC5(_ sender: Any) {
        showVC5()
    }
    
    
}
