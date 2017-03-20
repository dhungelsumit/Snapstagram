//
//  ShareViewController.swift
//  Instagram
//
//  Created by Sumit Dhungel on 3/12/17.
//  Copyright © 2017 Sumit Dhungel. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class ShareViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var postPhotoLabel: UIImageView!

    @IBOutlet weak var captionTextFiled: UITextField!
    @IBOutlet weak var albumButton: UIButton!
   
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var uploadButton: UIButton!
    let picker = UIImagePickerController()
    var image = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func albumButtonClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        present(vc, animated: true, completion: nil)
    }
    
    

     @IBAction func cameraButtonClick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated:true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        postPhotoLabel.image = editedImage
        // Do something with the images (based on your use case)
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
         MBProgressHUD.showAdded(to: self.view, animated: true)
        
        Post.postUserImage(image: postPhotoLabel.image,
                           withCaption: captionTextFiled.text,
                           withCompletion: { _ in
                           //s MBProgressHUD.showAdded(to: self.view, animated: true)
                            DispatchQueue.main.async {
                                self.postPhotoLabel.image = UIImage(named: "background-1" )
                                self.captionTextFiled.text = nil
                                MBProgressHUD.hide(for: self.view, animated: true)
                            }}
                
        )
       
        //Post.postUserImage(image: postPhotoLabel.image, withCaption: captionTextFiled.text, withCompletion: PFBooleanResultBlock?)
    }

       
    /*
     // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
