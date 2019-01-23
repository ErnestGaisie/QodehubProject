//
//  FirstViewController.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 18/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    
    var ordersArray = [AnyObject]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return ordersArray.count
        return ordersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
     
        let orderNo = ordersArray[indexPath.row]["delivery_name"]
        cell?.titleLabel.text = orderNo as? String
        
        let status = ordersArray[indexPath.row]["status"]
        cell?.statusLabel.text = status as? String
        
        let orderID = ordersArray[indexPath.row]["id"]
        cell?.orderIDLabel.text = orderID as? String
        
        let deliveryName = ordersArray[indexPath.row]["delivery_hall"]
        cell?.deliveryNameLabel.text = deliveryName as? String
        
        let total = ordersArray[indexPath.row]["total"]
        cell?.totalLabel.text = total as? String
        
        let date = ordersArray[indexPath.row]["created_at"]
        cell?.dateLabel.text = date as? String
        

       
        
        return cell!
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    
       Alamofire.request("https://poba.tech/windelivery/public/api/v1/auth/login",
                         method: .post,
                         parameters:["phone":"0275799028",
                                     "password":"secret",
                                     "fcm_device_id":"kgfvluyt"])
        .responseJSON { response in
//            print(response)
            let apiValue = JSON(response.result.value!)
//        let headers: [String:String] = [
//            "Authorization": "Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NjA2MFwvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NDcyMjMwNzcsImV4cCI6MTU3ODc1OTA3NywibmJmIjoxNTQ3MjIzMDc3LCJqdGkiOiJpY3dCVnRqTWtCWGl6TXloIiwic3ViIjoyLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.eHhuVjNIQh67ZLQCZSH-nPI5lsEG94P82MI_21c5T3k",
//            "Accept": "application/json",
//            "Content-Type" :"application/json"
//        ]
        
        

            Alamofire.request("https://poba.tech/windelivery/public/api/v1/orders",
                              method: .get,
                              encoding: JSONEncoding.default,
                              headers: [ "Authorization": "Bearer \(apiValue["data"]["access_token"])"])
//                .validate()
                .responseJSON { response in
                    print(response)
                    let result = response.result
                    if let dict = result.value as? Dictionary<String,AnyObject>{
                        print("Yo")
                        print(dict)
                        if let innerDict = dict["data"]{
                            self.ordersArray = innerDict as! [AnyObject]
                          self.tableView.reloadData()
                        }
                    }
                    
            }
            
        }
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func refresh(){
        Alamofire.request("https://poba.tech/windelivery/public/api/v1/orders",
                          method: .get ,
                          headers: ["Authoraziation: Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJod" ])
            .responseJSON{ response in
                print(response)
                let result = response.result
                
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    if let innerDict = dict["data"]{
                        self.ordersArray = innerDict as! [AnyObject]
                        self.tableView.reloadData()
                    }
                }
                
        }

    
                
                if let responseValue = response.result.value as! [String: Any]?{
                    print("Yo")
                    print(responseValue)
                    if let responseOrders = responseValue["data"] as! [[String: Any]]?{
                        print("Yo yo")
                        print(responseOrders)
                        self.ordersArray = responseOrders
                    }
                }
                */
        
    


}

