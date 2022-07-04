//
//  ViewController.swift
//  UIImage Cicle
//
//  Created by Natalia Givojno on 4.07.22.
//

import UIKit

struct ForImage {
    var title: String
    var image: UIImage
}

class ViewController: UIViewController {
    
    private let data = [
        ForImage(title: "egevika", image: #imageLiteral(resourceName: "egevika")),
        ForImage(title: "golubika", image: #imageLiteral(resourceName: "golubika")),
        ForImage(title: "malina", image: #imageLiteral(resourceName: "malina")),
        ForImage(title: "klubnika", image: #imageLiteral(resourceName: "klubnika"))
    ]
    
    private let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let ygodi = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ygodi.translatesAutoresizingMaskIntoConstraints = false
        ygodi.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return ygodi
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }

}
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
}

class CustomCell: UICollectionViewCell {
    
    var data: ForImage? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
            
        }
    }
    
    private let bg: UIImageView = {
       let iv = UIImageView()
        iv.addShadow()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
                iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addShadow(shadowColor: UIColor = .black, offset: CGSize = .init(width: 12, height: 12), opacity: Float = 0.8, radius: CGFloat = 12) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
}
