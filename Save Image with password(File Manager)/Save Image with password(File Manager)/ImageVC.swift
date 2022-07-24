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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pick", style: .plain, target: self, action: #selector(showChooseSourceTypeAlertController))
//         делегат средства выбора и связанные параметры
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
//         свойства imageView
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
//    @objc func pickAnImage(){
//        //            чтобы выбрать изображение, показать этот контроллер выбора
//        present(imagePicker, animated: true) {
//            print("UIImagePickerController: presented")
//        }
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
////         метод срабатывает, когда пользователь выбирает изображение и возвращает информацию о выбранном изображении.
////         Получить атрибут originImage в этом изображении, которым является само изображение
//        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            fatalError("error: did not picked a photo")
//        }
//         выполнить другие связанные операции по мере необходимости, выбрать изображение здесь и затем закрыть контроллер выбора
//        picker.dismiss(animated: true) { [unowned self] in
////             add a image view on self.view
//            self.imageView.image = selectedImage
//
//    }
//    }
    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        // когда пользователь нажимает для отмены
//        picker.dismiss(animated: true) {
//            print("UIImagePickerController: dismissed")
//        }
//    }
//    }

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
