//
//  detailsViewController.swift
//  
//
//  Created by Ernest Gaisie on 29/01/2019.
//

import UIKit

var orderTitle = ["Order ID","Service","Amount Paid","Charge","Total","Status","Order Place on","Completed at","Name","Phone","Hall"]

var orderDetail = ["","","","","","","","","","",""]

class detailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
  

  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orderTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = orderTitle[indexPath.row]
        
        return cell
    }
    



}
