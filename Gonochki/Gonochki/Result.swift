//
//  Result.swift
//  Gonochki
//
//  Created by Natalia Givojno on 3.07.22.
//

import Foundation
import UIKit

class GameResult:UIViewController {
    
    @IBOutlet weak var tableV: UITableView! {
        didSet{
            tableV?.delegate = self
            tableV?.dataSource = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.tableV.reloadData()
    }
    
}

extension GameResult: UITableViewDataSource, UITableViewDelegate {
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Saver.getSaver.resulti.count
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
            cell = dCell
        }else{
            cell = UITableViewCell()
        }
        
        cell.textLabel!.text = Saver.getSaver.resulti[indexPath.row].name
        return cell
    }
    
    func tableView (_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


