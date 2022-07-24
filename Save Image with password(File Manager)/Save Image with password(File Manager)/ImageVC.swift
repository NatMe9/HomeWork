//
//  ImageVC.swift
//  Save Image with password(File Manager)
//
//  Created by Natalia Givojno on 18.07.22.
//

import Foundation
import UIKit

class imageView: UIViewController   {
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    lazy var imageView = UIImageView(frame: view.frame)
    
    
    let fileManager = FileManager.default
    var imagePath: URL?
    
    
    @IBAction func saveImage(_ sender: Any) {
        
        guard let data = UIImage(named: "images")?.pngData(),
              let imagePath = imagePath?.appendingPathComponent("images.png") else { return }

        fileManager.createFile(atPath: imagePath.path, contents: data)
        print("save good!)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pick", style: .plain, target: self, action: #selector(showChooseSourceTypeAlertController))
//         делегат средства выбора и связанные параметры
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
//         свойства imageView
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        setupFileManager()
        
    }
    
    
    func setupFileManager() {
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let imagesDirectoryPath = documentPath?.appendingPathComponent("Images") else { return }
        imagePath = imagesDirectoryPath
        if !fileManager.fileExists(atPath: imagesDirectoryPath.path) {
            print("foobar")
            do {
                try fileManager.createDirectory(atPath: imagesDirectoryPath.path, withIntermediateDirectories: true)
            } catch {
                print("error")
            }
        }
    }
    
    
}


extension imageView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func showChooseSourceTypeAlertController() {
        let photoLibraryAction = UIAlertAction(title: "Choose a Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take a New Photo", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }

    @objc func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = editedImage.withRenderingMode(.alwaysOriginal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage.withRenderingMode(.alwaysOriginal)
        }
        dismiss(animated: true, completion: nil)
    }
}

class AlertService {

    static func showAlert(style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .cancel, handler: nil)], completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        if let topVC = UIApplication.getTopMostViewController() {
            alert.popoverPresentationController?.sourceView = topVC.view
            alert.popoverPresentationController?.sourceRect = CGRect(x: topVC.view.bounds.midX, y: topVC.view.bounds.midY, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = []
            topVC.present(alert, animated: true, completion: completion)
        }
    }

}

extension UIApplication {
    class func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base


    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var window: UIWindow?
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = imageView()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
