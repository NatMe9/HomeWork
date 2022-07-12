//
//  ViewController.swift
//  Gonochki
//
//  Created by Natalia Givojno on 3.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Total: UILabel!
    
    @IBOutlet weak var Buttons: UIButton!
    
    @IBOutlet weak var ButtonsR: UIButton!
    
    @IBOutlet weak var ButtonsI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        Buttons.addShadow()
        Buttons.addCornerRadius()
        ButtonsR.addShadow()
        ButtonsR.addCornerRadius()
        ButtonsI.addShadow()
        ButtonsI.addCornerRadius()
        
        
    }

    @IBAction func showGonochki(_ sender: Any) {
        showGame ()
    }
    
    @IBAction func showSettings(_ sender: Any) {
        showSettings()
    }
    
    @IBAction func showResult(_ sender: Any) {
        showResult()
    }
    
    
    private func showGame() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "Game")as? GameGonochki else {
                return
            }
        
        viewController.scoreRes = { score in
            let customString = "Score: \(score)"
            let attrString = NSMutableAttributedString(string: customString)
            self.Total.attributedText = attrString
        }
        
    
        self.navigationController?.pushViewController(viewController, animated: true)
//    present(viewController, animated: true)
}
    private func showSettings() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Settings")
        self.navigationController?.pushViewController(viewController, animated: true)
//        present(viewController, animated: true)
        
        
        }
    
    private func showResult() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Result")
        self.navigationController?.pushViewController(viewController, animated: true)
//        present(viewController, animated: true)
        }
    
}

extension UIView {
    func addShadow(shadowColor: UIColor = .black, offset: CGSize = .init(width: 3, height: 3), opacity: Float = 0.4, radius: CGFloat = 10) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func addCornerRadius() {
        layer.cornerRadius = layer.frame.height / 2
    }
    
}



