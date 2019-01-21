//
//  utilFunctions.swift
//  QodehubProject
//
//  Created by Ernest Gaisie on 21/01/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import Foundation
import UIKit


func navigateToPage(from:UIViewController,storyboardName:String,id:String) {
    
    let storyboard:UIStoryboard = UIStoryboard.init(name: storyboardName, bundle: nil)
    
    let mainTabBarController:UIViewController = storyboard.instantiateViewController(withIdentifier: id)
    from.present(mainTabBarController, animated: true, completion: nil)
}
