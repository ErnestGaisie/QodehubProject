//
//  LoginViewController.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 18/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            navigateToPage(from: self, storyboardName: "Main", id: "tabBarControllerID")
        }
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        
        let phoneNumber = phoneNumberTextField.text
        let password = passwordTextField.text
        
    Alamofire.request( "https://poba.tech/windelivery/public/api/v1/auth/login",
                       method: .post,
                       parameters:["phone":phoneNumber!,
                                  "password":password!,
                                  "fcm_device_id":"sdfvbkj"])
        .responseJSON{ response in
            
            var value = JSON(response.result.value!)
            
        
            
            
          
        
            if  value["success"].stringValue == "true"{
                print("Yo")
                print("\(value["data"]["access_token"])")
                
                let accessToken = "\(value["data"]["access_token"])"
                print("HI")
                print(accessToken)
                
                UserDefaults.standard.set(accessToken, forKey: "newAccess")
                
              
               
                UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
                navigateToPage(from: self, storyboardName: "Main", id: "tabBarControllerID")
                
               
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
