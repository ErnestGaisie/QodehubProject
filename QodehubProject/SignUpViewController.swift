//
//  SignUpViewController.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 18/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if nameTextField.text == nil || (nameTextField.text?.isEmpty)! {
            
            let alert = UIAlertController(title: "Error", message: "Name required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert,animated: true, completion: nil)
            
            return
        }
        if numberTextField == nil || (numberTextField.text?.isEmpty)!{
            
            let alert = UIAlertController(title: "Error", message: "Phone number required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert,animated: true, completion: nil)
            
            return
        }
        if passwordTextField == nil || (passwordTextField.text?.isEmpty)!{
           
            let alert = UIAlertController(title: "Error", message: "Password required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel)
            {
                UIAlertAction in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert,animated: true, completion: nil)
            
            return
        }
        
        let params = ["name": nameTextField.text!,
                          "phone": numberTextField.text!,
                          "password": passwordTextField.text!,
                          "fcm_device_id": "ytdvbliyutfg"
        ] as [String: Any]
        
        let apiMethod = "https://poba.tech/windelivery/public/api/v1/auth/register"
        
        Alamofire.request(apiMethod,
                          method: .post,
                          parameters: params
                          )
            .responseJSON{ response in
                print(response)
              let value = JSON(response.result.value!)
                
                if value["success"].stringValue == "true" {
                
               print(value)
                let alert = UIAlertController(title: "Congratulations", message: "REGISTRATION SUCCESSFUL", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel)
                {
                    UIAlertAction in
                    alert.dismiss(animated: true, completion: nil)
                })
                self.present(alert,animated: true, completion: nil)
                
                return
                }
                    
                    
                else
                {
                    
                    print("Error: \(String(describing: response.result.error))")
                    let alert = UIAlertController(title: "Error", message: "\(value["error"]["message"])", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
                    {
                        UIAlertAction in
                        alert.dismiss(animated: true, completion: nil)
                    })
                    self.present(alert,animated: true, completion: nil)
                    
                    return
                    
                }
                
                
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
