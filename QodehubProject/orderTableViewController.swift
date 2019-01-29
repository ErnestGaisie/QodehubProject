//
//  orderTableViewController.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 29/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class orderTableViewController: UITableViewController {

    var orderHead = ["Order ID","Service","Amount Paid","Charge","Total","Status","Order Place On","Completed at","Name","Phone","Hall"]
    var orderTitle = [AnyObject]()
    var detailArray:[String] = ["1","2","3","4","5","6","7","8","9","0","1"]
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderHead.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)

        cell.textLabel?.text = orderHead[indexPath.row] as! String
        
       
        

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accessToken = UserDefaults.standard.value(forKey: "newAccess") as! String
        let Token = "Bearer" + accessToken
        
        let id = UserDefaults.standard.value(forKey: "order")
        
        
        
        
        let newID = id!
        print("KO")
        print(newID)
        
        let url = "https://poba.tech/windelivery/public/api/v1/orders/" + "\(newID)"
        
        
        Alamofire.request(url,
                          method: .get,
                          parameters: ["id":newID],
                          headers: ["Authorization": Token]
                          )
            .responseJSON{ response in
                
               // let value = JSON(response.result.value!)
                print("Hioooo")
                print(response)
                
                let result = response.result
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    if let innerDict = dict["data"]{
                        print("Fly")
                        print(innerDict)
                        self.orderTitle = innerDict as! [AnyObject]
                        self.tableView.reloadData()
                    }
                }
                
        }
        
    }
    



}
