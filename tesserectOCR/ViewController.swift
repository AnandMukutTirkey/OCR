//
//  ViewController.swift
//  tesserectOCR
//
//  Created by Anand Mukut Tirkey on 22/02/17.
//  Copyright © 2017 anand. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    //let tesserect = G8Tesseract(language: "eng")
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if let tesserect = G8Tesseract(language: "eng"){
            tesserect.delegate = self
            tesserect.image = UIImage(named: "test")?.g8_blackAndWhite()
            tesserect.recognize()
            myTextField.text = tesserect.recognizedText
        }*/
        myTextField.text = "welcome to wonderLand™"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("recognition progress \(tesseract.progress) %")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func picker(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func camera(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        myImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func convert(_ sender: UIButton) {
        if let myData = UIImagePNGRepresentation(myImage.image!){
            if let tesserect = G8Tesseract(language: "eng"){
                tesserect.delegate = self
                tesserect.image = UIImage(data: myData)
                tesserect.recognize()
                myTextField.text = tesserect.recognizedText
            }
        }
    }
}

