//
//  ViewController.swift
//  brauser
//
//  Created by Natalia Givojno on 24.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func tapSearch(_ sender: Any) {
        if let text = textField.text {
            if let search = URL(string: text) {
                let field = URLRequest(url: search)
                webView.loadRequest(field)
            }
        }
    }
    @IBAction func tapBack(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func tapForward(_ sender: Any) {
        webView.goForward()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

