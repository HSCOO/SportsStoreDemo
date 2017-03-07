//
//  ProductTableCell.swift
//  SportsStoreDemo
//
//  Created by OnlyStu on 2017/3/5.
//  Copyright © 2017年 OnlyStu. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var stockStepper: UIStepper!
    
    @IBOutlet weak var stockField: UITextField!
    
    var product:Product?
    
//    var productId:Int?
    

}
