//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by Yap Moi Hoon on 2/5/19.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var displayImage: UIImageView!
    
    @IBAction func photoButton(_ sender: Any) {
        getphoto()
    }
    
    @IBAction func cameraButton(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title:nil, message: nil, preferredStyle:.actionSheet)
        let cancelAction = UIAlertAction(title: "Camera not available", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title:"Take Photo", style:.default, handler:{(_) in imagePicker.sourceType = .camera
                self.present(imagePicker,animated: true,completion:nil)
            })
            alertController.addAction(cameraAction)
        }
        
        present(alertController, animated: true, completion:nil)
        
    }
    func getphoto(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage
            else { return }
        displayImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

